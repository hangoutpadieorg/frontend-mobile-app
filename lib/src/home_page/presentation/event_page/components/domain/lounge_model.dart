class LoungeModel {
  static final lounges =[
    Lounge(id: 1, label: 'Oniru', imageUrl: 'assets/images/beaches.png'),
    Lounge(id: 2, label: 'Osun', imageUrl: 'assets/images/beaches.png'),
    Lounge(id: 3, label: 'Osa', imageUrl: 'assets/images/beaches.png'),
  ];
}


class Lounge{
  final int id;
  final String label;
  final String imageUrl;

  Lounge({
    required this.id,
    required this.label,
    required this.imageUrl,
  });
}