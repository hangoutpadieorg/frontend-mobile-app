import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:padie_mobile/common/widgets/isEmpty.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import '../../event_page/components/util.dart';
import '../../location_page/components/list_widget.dart';
import '../../location_page/location.dart';

import 'board_room/components/board_view.dart';


class Lounges extends ConsumerWidget {
  const Lounges({Key? key}) : super(key: key);
  static String routeName = "/lounges";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(locationProvider);
    final lounges = ref.watch(filteredTodoListProvider(Filter.lounge));
    return ScaffoldK(
      location: s,
      lists: lounges.isNotEmpty ? ListView.builder(
        itemCount: lounges.length,
        itemBuilder: (context, index){
          return ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address: lounges[index].address,
              heading: lounges[index].label,
              openTime: lounges[index].openTime,
              entryFee: lounges[index].entryFee as List<String>,
              details: lounges[index].details,
              images: lounges[index].detailImages as List<String>,
              latitude: lounges[index].latitude as double,
              longitude: lounges[index].longitude as double,
              eventId: lounges[index].id!,
            )));
          }, cats: lounges[index]);
        },
      ) : const IsEmpty(),
      title: 'LOUNGES',
    );
  }
}
