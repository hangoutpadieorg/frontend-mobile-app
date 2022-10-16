import 'package:flutter/material.dart';

import '../../../../../common/widgets/side_scroll_lists.dart';
import '../../common.dart';
import '../domain/drinks_model.dart';

final ScrollController controller = ScrollController();
class DrinkList extends StatelessWidget {
  const DrinkList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldM(
      location: '',
      title: 'DRINKS',
      lists: ListView.builder(
        itemCount: DrinksModel.drinks.length,
        itemBuilder: (context, index){
          return _ListWidget(onTap: (){DrinksModel.drinks[index];},drinks: DrinksModel.drinks[index],);
        },
      ),
    );
  }
}



class _ListWidget extends StatelessWidget {
  const _ListWidget({Key? key,  required this.onTap, required this.drinks}) : super(key: key);
  final Drinks drinks;
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
              label: drinks.label2,),
          ],
        ),
      ),
    );
  }
}
