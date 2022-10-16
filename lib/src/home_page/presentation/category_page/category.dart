import 'package:flutter/material.dart';

import '../../../../common/widgets/side_scroll_lists.dart';
import 'presentation/artGallery_list_page.dart';
import 'presentation/bar_list_page.dart';
import 'presentation/beach_list_page.dart';
import 'presentation/cafe_list_page.dart';
import 'presentation/lounge_list_page.dart';
import 'presentation/restaurant_list_page.dart';


// class Categories extends StatefulWidget {
//   const Categories({Key? key}) : super(key: key);
//
//   @override
//   State<Categories> createState() => _CategoriesState();
// }
//
// class _CategoriesState extends State<Categories> {
//
//   final List images = const [
//     'assets/images/clubs.png'
//     'assets/images/bars.png'
//     'assets/images/cafes.png'
//     'assets/images/beaches.png'
//         'assets/images/lounges.png'
//         'assets/images/art_galleries.png'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ListView.builder(
//         itemCount: 6,
//         itemBuilder: (context, index){
//           return Stacked(label: images[index].toString(), coverImage: 'assets/images/art_galleries.png', onTap: (){});
//         },
//       ),
//     );
//   }
// }
//
//
//

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stacked(coverImage: 'assets/images/clubs.png', label: 'CLUBS',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Bars()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/bars.png', label: 'BARS',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Bars()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/cafes.png', label: 'CAFES',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Cafes()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/beaches.png', label: 'BEACHES',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Beaches()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/lounges.png', label: 'LOUNGES',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Lounges()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/restaurant.png', label: 'RESTAURANT',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Restaurants()));
            },),
            const SizedBox(height: 40,),
            Stacked(coverImage: 'assets/images/art_galleries.png', label: 'ART GALLERIES',onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ArtGallery()));
            },),
            // const Spacer(),
            const SizedBox(height: 300,),

          ],
        ),
      ),
    );
  }
}

