

class RestaurantModel {
  static final restaurants =[
    Restaurant(id: 1, label: 'LA MANGO', imageUrl: 'assets/images/beaches.png'),
    Restaurant(id: 2, label: 'CACTUS', imageUrl: 'assets/images/beaches.png'),
    Restaurant(id: 2, label: 'SAILOR\'S LOUNGES', imageUrl: 'assets/images/beaches.png'),
    Restaurant(id: 3, label: 'BAY\'S LOUNGES', imageUrl: 'assets/images/beaches.png'),
  ];
}


class Restaurant{
  final int id;
  final String label;
  final String imageUrl;

  Restaurant({
    required this.id,
    required this.label,
    required this.imageUrl,
  });
}