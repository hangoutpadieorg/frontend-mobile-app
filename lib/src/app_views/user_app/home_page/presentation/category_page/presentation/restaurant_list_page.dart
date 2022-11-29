import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../event_page/components/util.dart';
import '../../location_page/components/list_widget.dart';
import '../../location_page/location.dart';
import 'package:padie_mobile/common/widgets/isEmpty.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import 'board_room/components/board_view.dart';

class Restaurants extends ConsumerWidget {
  const Restaurants({Key? key}) : super(key: key);
  static String routeName = "/restaurants";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(locationProvider);
    final restaurants = ref.watch(filteredTodoListProvider(Filter.restaurants));
    return ScaffoldK(
      location: s,
      lists: restaurants.isNotEmpty ? ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index){
          return ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address: restaurants[index].address,
              heading: restaurants[index].label,
              openTime: restaurants[index].openTime,
              entryFee: restaurants[index].entryFee as List<String>,
              details: restaurants[index].details,
              images: restaurants[index].detailImages as List<String>,
              latitude: restaurants[index].latitude as double,
              longitude: restaurants[index].longitude as double,
              eventId: restaurants[index].id!,
            )));
          }, cats: restaurants[index]);
        },
      ) : const IsEmpty(),
      title: 'RESTAURANTS',
    );
  }
}

