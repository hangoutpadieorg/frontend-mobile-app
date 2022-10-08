class BarModel {
  static final bars =[
    Bar(id: 1, label: 'SAILOR\'S LOUNGES & BAR', imageUrl: 'assets/images/bars.png'),
    Bar(id: 2, label: 'BISTRO7', imageUrl: 'assets/images/clubs.png'),
    Bar(id: 3, label: 'SAILOR\'S LOUNGES', imageUrl: 'assets/images/bars.png'),
    Bar(id: 4, label: 'CUBANA CLUB', imageUrl: 'assets/images/clubs.png'),
  ];
}


class Bar{
  final int id;
  final String label;
  final String imageUrl;

  Bar({
    required this.id,
    required this.label,
    required this.imageUrl,
  });
}