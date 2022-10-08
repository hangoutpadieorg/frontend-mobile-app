import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/side_scroll_lists.dart';

import '../../../../../../common/constants/colors.dart';
import '../domain/cafe_model.dart';
import '../util.dart';

class Cafes extends StatefulWidget {
  const Cafes({Key? key}) : super(key: key);

  @override
  State<Cafes> createState() => _CafesState();
}

List titles = [
  'ARTICAN BEACH'
      'ONIRU BEACH'
      'SAILOR BEACH'
];
List images = [
  Image.asset('assets/images/beaches.png'),
  Image.asset('assets/images/beaches.png'),
  Image.asset('assets/images/beaches.png'),
];
class _CafesState extends State<Cafes> {

  @override
  Widget build(BuildContext context) {
    return ScaffoldK(
      lists: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        itemCount: EventModel.events.length,
        itemBuilder: (context, index){
          // for(var item in images)
          return _EventWidget(onTap: (){}, event: EventModel.events[index]);
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
              width: MediaQuery.of(context).size.width * 0.8,
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
                width: MediaQuery.of(context).size.width * 0.8,
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

