class BarModel {
  static final bars =[
    Bar(id: 1, label: 'SAILOR\'S LOUNGES & BAR', imageUrl: 'assets/images/bars.png',address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Bar(id: 2, label: 'BISTRO7', imageUrl: 'assets/images/clubs.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Bar(id: 3, label: 'SAILOR\'S LOUNGES', imageUrl: 'assets/images/bars.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),
    Bar(id: 4, label: 'CUBANA CLUB', imageUrl: 'assets/images/clubs.png',address: 'Gbagbada, Abuja', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),
  ];
}


class Bar{
  final int id;
  final String label;
  final String imageUrl;
  final String address;
  final String details;
  final String openTime;
  final String entryFee;
  final List<String>? detailImages;

  Bar({
    required this.id,
    required this.label,
    required this.imageUrl,
    required this.address,
    required this.details,
    required this.openTime,
    required this.entryFee,
    this.detailImages,
  });
}