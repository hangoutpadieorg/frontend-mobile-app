

class RestaurantModel {
  static final restaurants =[
    Restaurant(id: 1, label: 'LA MANGO', imageUrl: 'assets/images/beaches.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Restaurant(id: 2, label: 'CACTUS', imageUrl: 'assets/images/beaches.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Restaurant(id: 2, label: 'SAILOR\'S LOUNGES', imageUrl: 'assets/images/beaches.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Restaurant(id: 3, label: 'BAY\'S LOUNGES', imageUrl: 'assets/images/beaches.png',
        address: 'Alagbado, Kwara', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),
  ];
}


class Restaurant{
  final int id;
  final String label;
  final String imageUrl;
  final String address;
  final String details;
  final String openTime;
  final String entryFee;
  final List<String>? detailImages;

  Restaurant({
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