import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../common/constants/colors.dart';
import '../../event_page/components/util.dart';
import '../../location_page/location.dart';
import '../domain/beach_model.dart';
import 'board_room/components/board_view.dart';


class Beaches extends ConsumerStatefulWidget {
  const Beaches({Key? key}) : super(key: key);

  @override
  ConsumerState<Beaches> createState() => _BeachesState();
}

class _BeachesState extends ConsumerState<Beaches> {
  @override
  Widget build(BuildContext context) {
    final s = ref.watch(locationProvider);
    return ScaffoldK(
      location: s,
      lists: ListView.builder(
        itemCount: BeachModel.beaches.length,
        itemBuilder: (context, index){
          return _ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address:  BeachModel.beaches[index].address,
              heading:  BeachModel.beaches[index].label,
              openTime:  BeachModel.beaches[index].openTime,
              entryFee:  BeachModel.beaches[index].entryFee,
              details:  BeachModel.beaches[index].details,
              images:  BeachModel.beaches[index].detailImages,
            )));
          }, event: BeachModel.beaches[index]);
        },
      ),
      title: 'BEACHES',
    );
  }
}


class _ListWidget extends StatelessWidget {
  const _ListWidget({Key? key,  required this.onTap, required this.event}) : super(key: key);
  final Beach event;
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