import 'package:flutter/material.dart';

import 'package:padie_mobile/common/widgets/side_scroll_lists.dart';
import '../../common.dart';
import '../domain/meals_model.dart';


final ScrollController controller = ScrollController();
class MealList extends StatelessWidget {
  const MealList({Key? key}) : super(key: key);
  static String routeName = "/meals_page";

  @override
  Widget build(BuildContext context) {
    return ScaffoldM(
      location: '',
      title: 'DRINKS',
      lists: ListView.builder(
        itemCount: MealsModel.meals.length,
        itemBuilder: (context, index){
          return _ListWidget(onTap: (){},drinks: MealsModel.meals[index],);
        },
      ),
    );
  }
}



class _ListWidget extends StatelessWidget {
  const _ListWidget({Key? key,  required this.onTap, required this.drinks}) : super(key: key);
  final Meals drinks;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SideScrollList(title: drinks.title,
      widget: SizedBox(
        height: 200,
        child: ListView(
          controller: controller,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          children: [
            Stacked(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Restaurants()));
              },
              coverImage: drinks.imageUrl,
              label: drinks.label,),

            Stacked(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Restaurants()));
              },
              coverImage: drinks.imageUrl2,
              label: drinks.label2,)
          ],
        ),
      ),
    );
  }
}
