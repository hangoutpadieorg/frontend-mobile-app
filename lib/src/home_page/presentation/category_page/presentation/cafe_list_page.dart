import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/home_page/presentation/location_page/location.dart';

import '../../../../../../common/constants/colors.dart';

import '../../event_page/components/util.dart';
import '../domain/cafe_model.dart';
import 'board_room/components/board_view.dart';


class Cafes extends ConsumerStatefulWidget {
  const Cafes({Key? key}) : super(key: key);

  @override

  ConsumerState<Cafes> createState() => _CafesState();
}

class _CafesState extends ConsumerState<Cafes> {

  @override
  Widget build(BuildContext context) {
    final s = ref.watch(locationProvider);
    return ScaffoldK(
      location: s,
      lists: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        itemCount: EventModel.events.length,
        itemBuilder: (context, index){
          // for(var item in images)
          return _EventWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address:  EventModel.events[index].address,
              heading:  EventModel.events[index].label,
              openTime:  EventModel.events[index].openTime,
              entryFee:  EventModel.events[index].entryFee,
              details:  EventModel.events[index].details,
              images:  EventModel.events[index].detailImages,
            )));
          }, event: EventModel.events[index]);
        },
      ),
      title: 'CAFE\'S',
    );
  }
}


class _EventWidget extends StatelessWidget {
  const _EventWidget({Key? key,  required this.onTap, required this.event}) : super(key: key);
  final Event event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            // right: 30,
          top: 40,
        ),
        child: Stack(
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.86,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(event.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    event.label,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

