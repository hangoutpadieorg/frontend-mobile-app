import 'dart:ui';

class MealsModel {
  static final meals =[
    Meals(id: 1, label: '', imageUrl: 'assets/images/jollof.png', title: 'Rice & Swallow', onTap: () {  }, imageUrl2: 'assets/images/iyan.png', label2: ''),
    Meals(id: 2, label: '', imageUrl: 'assets/images/chicken.png', title: 'Protein', onTap: () {  }, imageUrl2: 'assets/images/beef.png', label2: ''),
    Meals(id: 3, label: '', imageUrl: 'assets/images/grils.png', title: 'Fries', onTap: () {  }, imageUrl2: 'assets/images/burger.png', label2: ''),
  ];
}


class Meals{
  final int id;
  final String label;
  final String label2;
  final String imageUrl;
  final String imageUrl2;
  final String title;
  final VoidCallback onTap;

  Meals({
    required this.imageUrl2,
    required this.label2,
    required this.onTap,
    required this.id,
    required this.label,
    required this.imageUrl,
    required this.title
  });
}