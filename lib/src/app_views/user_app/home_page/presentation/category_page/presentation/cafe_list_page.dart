import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../event_page/components/util.dart';
import '../../location_page/components/list_widget.dart';
import '../../location_page/location.dart';
import 'package:padie_mobile/common/widgets/isEmpty.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import 'board_room/components/board_view.dart';


class Cafes extends ConsumerWidget {
  const Cafes({Key? key}) : super(key: key);
  static String routeName = "/cafes";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(locationProvider);
    final cafes = ref.watch(filteredTodoListProvider(Filter.cafe));
    return ScaffoldK(
      location: s,
      lists: cafes.isNotEmpty ? ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        itemCount: cafes.length,
        itemBuilder: (context, index){
          // for(var item in images)
          return ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address: cafes[index].address,
              heading: cafes[index].label,
              openTime: cafes[index].openTime,
              entryFee: cafes[index].entryFee as List<String>,
              details: cafes[index].details,
              images: cafes[index].detailImages as List<String>,
              latitude: cafes[index].latitude as double,
              longitude: cafes[index].longitude as double,
              eventId: cafes[index].id!,
            )));
          }, cats: cafes[index]);
        },
      ) : const IsEmpty(),
      title: 'CAFE\'S',
    );
  }
}

