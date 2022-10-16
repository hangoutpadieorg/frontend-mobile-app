import 'dart:ui';

class DrinksModel {
  static final drinks =[
    Drinks(id: 1, label: 'Vodka', imageUrl: 'assets/images/hard.png', title: 'Alcohols & Beers', onTap: () {  }, label2: 'Beers', imageUrl2: 'assets/images/beers.png'),
    Drinks(id: 2, label: 'Soft drinks', imageUrl: 'assets/images/restaurant.png', title: 'Soft Drinks & Juices', onTap: () {  }, label2: 'Juices', imageUrl2: 'assets/images/juice2.png'),
    Drinks(id: 3, label: 'Cocktails', imageUrl: 'assets/images/bars.png', title: 'Cocktails & Special Drinks', onTap: () {  }, label2: 'Juices', imageUrl2: 'assets/images/juice1.png'),
  ];
}


class Drinks{
  final int id;
  final String label;
  final String label2;
  final String imageUrl;
  final String imageUrl2;
  final String title;
  final VoidCallback onTap;

  Drinks({
    required this.label2,
    required this.imageUrl2,
    required this.onTap,
    required this.id,
    required this.label,
    required this.imageUrl,
    required this.title
  });
}