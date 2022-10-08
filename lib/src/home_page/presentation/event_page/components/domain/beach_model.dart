class BeachModel {
  static final beaches =[
    Beach(id: 1, label: 'ARTICAN', imageUrl: 'assets/images/artican.png'),
    Beach(id: 2, label: 'ONIRU', imageUrl: 'assets/images/beaches.png'),
    Beach(id: 3, label: 'SAILOR\'S LOUNGES', imageUrl: 'assets/images/beaches.png'),
    Beach(id: 4, label: 'BAY\'S LOUNGES', imageUrl: 'assets/images/beaches.png'),
  ];
}


class Beach{
  final int id;
  final String label;
  final String imageUrl;

  Beach({
    required this.id,
    required this.label,
    required this.imageUrl,
  });
}