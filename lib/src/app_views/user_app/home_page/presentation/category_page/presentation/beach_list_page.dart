import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../event_page/components/util.dart';
import '../../location_page/components/list_widget.dart';
import '../../location_page/location.dart';
import 'package:padie_mobile/common/widgets/isEmpty.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import 'board_room/components/board_view.dart';


/* Page that contains list of beaches */
class Beaches extends ConsumerWidget {
  const Beaches({Key? key}) : super(key: key);
  static String routeName = "/beaches";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(locationProvider);
    final beaches = ref.watch(filteredTodoListProvider(Filter.beach));
    return ScaffoldK(
      location: s,
      lists: beaches.isNotEmpty ? ListView.builder(
        itemCount: beaches.length,
        itemBuilder: (context, index){
          return ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address: beaches[index].address,
              heading: beaches[index].label,
              openTime: beaches[index].openTime,
              entryFee: beaches[index].entryFee as List<String>,
              details: beaches[index].details,
              images: beaches[index].detailImages as List<String>,
              latitude: beaches[index].latitude as double,
              longitude: beaches[index].longitude as double,
              eventId: beaches[index].id!,
            )));
          }, cats: beaches[index]);
        },
      ) : const IsEmpty(),
      title: 'BEACHES',
    );
  }
}


