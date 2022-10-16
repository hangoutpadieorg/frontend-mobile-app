import 'dart:ui';

class SpecialsModel {
  static final specials =[
    Specials(id: 1, label: '', imageUrl: 'assets/images/pepper_soup.png', title: 'Pepper Soup', onTap: () {  }, imageUrl2: 'assets/images/bokoto.png'),
    Specials(id: 2, label: '', imageUrl: 'assets/images/asun.png', title: 'Grills', onTap: () {  }, imageUrl2: 'assets/images/asun2.png'),
    Specials(id: 3, label: '', imageUrl: 'assets/images/shawarma.png', title: 'Shawarma', onTap: () {  }, imageUrl2: 'assets/images/hot_dogs.png'),
  ];
}


class Specials{
  final int id;
  final String label;
  final String imageUrl;
  final String imageUrl2;
  final String title;
  final VoidCallback onTap;

  Specials({
    required this.imageUrl2,
    required this.onTap,
    required this.id,
    required this.label,
    required this.imageUrl,
    required this.title
  });
}