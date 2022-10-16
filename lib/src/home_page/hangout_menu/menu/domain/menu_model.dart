import 'package:flutter/material.dart';

import '../../drinks/presentation/drinks_page.dart';

class MenuModel {
  static final menu =[
    Menu(id: 1, label: 'DRINKS', imageUrl: 'assets/images/hard.png', onTap: (){}),
    Menu(id: 2, label: 'MEALS', imageUrl: 'assets/images/restaurant.png'),
    Menu(id: 3, label: 'PROTEINS', imageUrl: 'assets/images/chicken.png'),
  ];
}


class Menu{
  final int id;
  final String label;
  final String imageUrl;
  final VoidCallback? onTap;

  Menu({
    required this.id,
    required this.label,
    required this.imageUrl,
    this.onTap
  });
}