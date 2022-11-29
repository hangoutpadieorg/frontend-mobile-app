import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/side_scroll_lists.dart';

import '../category_page/presentation/restaurant_list_page.dart';
import 'components/domain/event_model.dart';


enum EventK {carnival, comedy}

final ScrollController controller = ScrollController();
class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);
  static String routeName = "/events_page";

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {

  @override
  Widget build(BuildContext context) {

    EventModel data = EventModel(id: 0, category: EventK.carnival.name, name: 'Restaurant', imageCover: 'assets/images/beaches.png');
    return ListView(
      controller: controller,
      children: [
        SideScrollList(title: data.category,
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Restaurants()));
                  },
                  coverImage: data.imageCover,
                  label: data.name,);
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


