import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import '../../../../../../../../../common/constants/colors.dart';
import '../../../../../../../../../common/constants/size_config.dart';
import '../../../../../../../../../common/constants/utils.dart';
import '../../../../../../../../../common/widgets/isEmpty.dart';

class MapViews extends ConsumerStatefulWidget {
  const MapViews({Key? key, required this.latitude, required this.longitude}) : super(key: key);
  final double latitude;
  final double longitude;

  @override
  ConsumerState<MapViews> createState() => _MapViewsState();
}

class _MapViewsState extends ConsumerState<MapViews> {
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272168);
  // LatLng destination = LatLng(latitude!, longitude!);
  // static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polyLineCoordinates = [];
  LocationData? currentLocation;
  double? latitudeK;
  double? longitudeK;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async{
    Location location = Location();

    location.getLocation().then((location) {
      currentLocation = location;
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(newLoc.latitude!, newLoc.longitude!),)));
      setState(() {

      });
    });
  }

  void getPolyPoints() async{
    PolylinePoints polylinePoints = PolylinePoints();
    // final latitudeK = la

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(latitudeK!, longitudeK!)
    );
    if(result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) => polyLineCoordinates.add(LatLng(point.latitude, point.longitude)),);
      setState(() {

      });
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assetName').then((value) {
      sourceIcon = value;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assetName').then((value) {
      currentLocationIcon = value;
    });
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, 'assetName').then((value) {
      destinationIcon = value;
    });
  }

  @override
  void initState(){
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    latitudeK = widget.latitude;
    longitudeK = widget.longitude;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [Align(
            alignment: Alignment.center,
            child: GestureDetector(child: Text('Back!', style: TextStyle( color: kOrange,fontSize: getFontSize(17)),), onTap: (){Navigator.pop(context);},))],
      ),
      body: currentLocation == null ? const IsEmpty(err: 'Unable to get current Location',) : GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), zoom: 13.5),
        polylines: {
          Polyline(polylineId: const PolylineId('route'),
            points: polyLineCoordinates,
            color: Colors.blue,
            width: 6
          ),
        },
        markers: {
           Marker(
              markerId: const MarkerId('currentLocation'),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
             // icon: currentLocationIcon,
          ),
          const Marker(
            markerId: MarkerId('source'),
            position: sourceLocation,
          ),
           Marker(
            markerId: const MarkerId('destination'),
            position: LatLng(latitudeK!, longitudeK!),
          ),
        },
        onMapCreated: (mapController) {
          _controller.complete(mapController);
        },
      ),
    );
  }
}
