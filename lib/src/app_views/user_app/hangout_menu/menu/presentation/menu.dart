import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/common/constants/colors.dart';

import '../../../../../../common/constants/strings.dart';
import '../../common.dart';
import '../domain/menu_model.dart';

class HangoutMenu extends ConsumerWidget{
  const HangoutMenu({Key? key}) : super(key: key);
  // static String routeName = "/hangout_menu";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///Provider to read the event model
    // final reader = ref.watch(categoryListProvider(Filter.beach));
    return ScaffoldM(
      location: '',
      title: 'MENU',
      lists: ListView(
        children: [
          _ListWidget(onTap: (){
            Navigator.of(context).pushNamed(drinkList);
          }, event: MenuModel.menu[0]),

          _ListWidget(onTap: (){
            Navigator.of(context).pushNamed(mealList);
          }, event: MenuModel.menu[1]),
          //
          _ListWidget(onTap: (){
            Navigator.of(context).pushNamed(specialList);
          }, event: MenuModel.menu[2]),
        ],
      ),
    );
  }
}




class _ListWidget extends StatelessWidget {
  const _ListWidget({Key? key,  required this.onTap, required this.event}) : super(key: key);
  final Menu event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          // right: 30,
          top: 40,
        ),
        child: Stack(
          children: [
            Container(
              height: 210,
              width: MediaQuery.of(context).size.width * 0.86,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(event.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: 150,
              left: 0,
              right: 0,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.86,
                decoration: BoxDecoration(
                  color: kGrey2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    event.label,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}