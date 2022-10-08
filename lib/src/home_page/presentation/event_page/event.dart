import 'package:flutter/material.dart';

import '../../../../common/widgets/side_scroll_lists.dart';
import 'components/presentation/cafe_list_page.dart';

final ScrollController controller = ScrollController();
class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        SideScrollList(title: 'Carnival',
          widget: SizedBox(
            height: 200,
            child: ListView.builder(
              controller: controller,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index){
                return Stacked(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cafes()));
                  },
                  coverImage: 'assets/images/beaches.png',
                  label: 'Restaurant',);
              },
            ),
          ),
        ),
        const SizedBox(height: 20,),
        SideScrollList(title: 'Comedy Shows',
          widget: SizedBox(
            height: 200,
            child: ListView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index){
                return Stacked(
                  onTap: (){},
                  coverImage: 'assets/images/clubs.png',
                  label: 'Restaurant',);
              },
            ),
          ),
        )

      ],
    );
  }
}


//
// void main(){
//   for(int i=0; i<30; i++){
//     if(i%2 != 0){
//       print(i);
//     }
//   }
// }