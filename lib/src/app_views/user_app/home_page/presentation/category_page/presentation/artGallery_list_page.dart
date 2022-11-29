
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/common/widgets/isEmpty.dart';
import 'package:padie_mobile/src/controllers/category_controller.dart';
import '../../event_page/components/util.dart';
import '../../location_page/components/list_widget.dart';
import '../../location_page/location.dart';
import 'board_room/components/board_view.dart';


class ArtGallery extends ConsumerWidget {
  const ArtGallery({Key? key}) : super(key: key);
  static String routeName = "/art_galley";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = ref.watch(locationProvider);
    ///
    final arts = ref.watch(filteredTodoListProvider(Filter.artGallery));

    return ScaffoldK(
      location: s,
      lists: arts.isNotEmpty ? ListView.builder(
        itemCount: arts.length,
        itemBuilder: (context, index){
          return ListWidget(onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  BoardRoom(
              address: arts[index].address,
              heading: arts[index].label,
              openTime: arts[index].openTime,
              entryFee: arts[index].entryFee as List<String>,
              details: arts[index].details,
              images: arts[index].detailImages as List<String>,
              latitude: arts[index].latitude as double,
              longitude: arts[index].longitude as double,
              eventId: arts[index].id!,
            )));
          }, cats: arts[index]);
        },
      ) : const IsEmpty() ,
      title: 'ART GALLERIES/MUSEUM',
    );
  }
}




///Custom list Widget
// class _ListWidget extends StatelessWidget {
//   const _ListWidget({Key? key,  required this.onTap, required this.event}) : super(key: key);
//   final Art event;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.only(
//           // right: 30,
//           top: 40,
//         ),
//         child: Stack(
//           children: [
//             Container(
//               height: 210,
//               width: MediaQuery.of(context).size.width * 0.86,
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 image: DecorationImage(
//                   image: AssetImage(event.imageUrl),
//                   fit: BoxFit.cover,
//                 ),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//             Positioned(
//               top: 150,
//               left: 0,
//               right: 0,
//               child: Container(
//                 height: 60,
//                 width: MediaQuery.of(context).size.width * 0.86,
//                 decoration: BoxDecoration(
//                   color: kGrey2,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     event.label,
//                     style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 18
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

