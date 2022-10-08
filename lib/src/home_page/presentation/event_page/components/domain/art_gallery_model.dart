class ArtModel {
  static final arts =[
    Art(id: 1, label: 'NIKE ART GALLERY', imageUrl: 'assets/images/art_galleries.png'),
    Art(id: 2, label: 'ART CAFE', imageUrl: 'assets/images/art_galleries.png'),
    Art(id: 3, label: 'SAILOR\'S LOUNGES', imageUrl: 'assets/images/art_galleries.png'),
    Art(id: 4, label: 'BAY\'S LOUNGES', imageUrl: 'assets/images/art_galleries.png'),
  ];
}


class Art{
  final int id;
  final String label;
  final String imageUrl;

  Art({
    required this.id,
    required this.label,
    required this.imageUrl,
  });
}