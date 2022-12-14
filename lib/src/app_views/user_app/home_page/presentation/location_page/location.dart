import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/common/constants/colors.dart';
import 'package:padie_mobile/common/constants/size_config.dart';


import 'components/location_page_view.dart';





///// Class to change the location String
class LocationString extends StateNotifier<String>{
  LocationString() : super('Abuja');

  void change(String text) =>
      state = text;
}
// void selected() =>
/////// Location String provider
final locationProvider = StateNotifierProvider<LocationString, String>((ref) => LocationString());


class Locations extends ConsumerStatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  ConsumerState<Locations> createState() => _LocationsState();
}

class _LocationsState extends ConsumerState<Locations> {
  LocationE? _e;
  @override
  Widget build(BuildContext context) {
    // final s = ref.watch(locationProvider);
    return SizedBox(
      child: Column(
        children: [
          const Text(
            'Please select you location',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 28,),
          RadioListTile<LocationE>(
            title: const ContainerK(label: 'ABUJA',),
            activeColor: kOrange,
              value: LocationE.abuja,
              groupValue: _e,
              onChanged: (LocationE? value){
                setState(() {
                  _e = value!;
                  ref.read(locationProvider.notifier).change('Abuja');

                  ///// Route to SelectedLocationView
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectedLocationView(location: 'ABUJA',)));
                });
              },
          ),

          const SizedBox(height: 20,),
          RadioListTile<LocationE>(
            title: const ContainerK(label: 'LAGOS',),
            activeColor: kOrange,
            value: LocationE.lagos,
            groupValue: _e,
            onChanged: (LocationE? value){
              setState(() {
                _e = value!;
                ref.read(locationProvider.notifier).change('Lagos');

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectedLocationView(location: 'LAGOS',)));
              });
            },
          ),


          const SizedBox(height: 20,),
          RadioListTile<LocationE>(
            title: const ContainerK(label: 'PORT HARCOURT',),
            activeColor: kOrange,
            value: LocationE.port_harcourt,
            groupValue: _e,
            onChanged: (LocationE? value){
              setState(() {
                _e = value!;
                ref.read(locationProvider.notifier).change('Port Harcourt');

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SelectedLocationView(location: 'PORT HARCOURT',)));
              });
            },
          ),
          // const SizedBox(width: 10,),
        ],
      ),
    );
  }
}



//// Custom shadowed container for location label
class ContainerK extends StatelessWidget {
  const ContainerK({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(55),
      width: getProportionateScreenWidth(270),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
          color: const Color(0XFFdae1eb),
          boxShadow: const[
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 6, // soften the shadow
              spreadRadius: 3, //end the shadow
              offset: Offset(
                6.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              blurRadius: 6, // soften the shadow
              spreadRadius: 3, //end the shadow
              offset: Offset(
                -6.0, // Move to right 10  horizontally
                -2.0, // Move to bottom 10 Vertically
              ),
            ),
          ]
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}


////// Location enum
enum LocationE{
  abuja,
  lagos,
  port_harcourt
}