import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../event_page/components/util.dart';
import '../../location_page/components/list_widget.dart';
import '../../location_page/location.dart';
import 'package:padie_mobile/common/widgets/isEmpty.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import 'board_room/components/board_view.dart';



class Bars extends ConsumerWidget {
  const Bars({Key? key}) : super(key: key);
  // static String routeName = "/bars";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(locationProvider);
    final bars = ref.watch(filteredTodoListProvider(Filter.clubs));
    return ScaffoldK(
      location: s,
      lists: bars.isNotEmpty ? ListView.builder(
        itemCount: bars.length,
        itemBuilder: (context, index){
          return ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address: bars[index].address,
              heading: bars[index].label,
              openTime: bars[index].openTime,
              entryFee: bars[index].entryFee as List<String>,
              details: bars[index].details,
              images: bars[index].detailImages as List<String>,
              latitude: bars[index].latitude as double,
              longitude: bars[index].longitude as double,
              eventId: bars[index].id!,
            )));
          }, cats: bars[index]);
        },
      ) : const IsEmpty(),
      title: 'BARS',
    );
  }
}
