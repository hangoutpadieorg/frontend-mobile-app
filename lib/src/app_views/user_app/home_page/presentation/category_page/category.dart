import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/side_scroll_lists.dart';

// import '../../../../../common/constants/strings.dart';

import 'presentation/artGallery_list_page.dart';
import 'presentation/bar_list_page.dart';
import 'presentation/beach_list_page.dart';
import 'presentation/cafe_list_page.dart';
import 'presentation/lounge_list_page.dart';
import 'presentation/restaurant_list_page.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);
  static String routeName = "/categories_page";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stacked(coverImage: 'assets/images/clubs.png', label: 'CLUBS',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Bars()));
              // Navigator.of(context).pushNamed(bars);
            },),
            // TextButton(onPressed: (){Navigator.of(context).pushNamed(bars);}, child: Text('data')),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/bars.png', label: 'BARS',onTap: (){
              // Navigator.of(context).pushNamed(bars);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Bars()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/cafes.png', label: 'CAFES',onTap: (){
              // Navigator.of(context).pushNamed(Cafes.routeName);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Cafes()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/beaches.png', label: 'BEACHES',onTap: (){
              // Navigator.of(context).pushNamed(Beaches.routeName);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Beaches()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/lounges.png', label: 'LOUNGES',onTap: (){
              // Navigator.of(context).pushNamed(Lounges.routeName);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Lounges()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/restaurant.png', label: 'RESTAURANT',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Restaurants()));
              // Navigator.of(context).pushNamed(Restaurants.routeName);
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/art_galleries.png', label: 'ART GALLERIES',onTap: (){
              // Navigator.of(context).pushNamed(ArtGallery.routeName);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArtGallery()));
            },),
            // const Spacer(),
            const SizedBox(height: 300,),

          ],
        ),
      ),
    );
  }
}

