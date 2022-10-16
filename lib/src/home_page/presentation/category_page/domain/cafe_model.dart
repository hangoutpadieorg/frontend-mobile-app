

class EventModel {
  static final events =[
    Event(id: 1, label: 'HARD ROCK', imageUrl: 'assets/images/hard.png',address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Event(id: 2, label: 'BHEERHUGZ CAFE', imageUrl: 'assets/images/bheer.png',address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Event(id: 2, label: 'COFFEE ROYALE', imageUrl: 'assets/images/coffee.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),

    Event(id: 3, label: 'VESTOR\'S CAFE', imageUrl: 'assets/images/cafes.png', address: 'Gbagbada, Lagos', details: 'The boardroom is an exciting place to be. It is situated at the heartbeat of Lagos on Victoria Island see more....',
        openTime: '10am', entryFee: 'Free',
        detailImages: [
          'assets/images/stack2.png',
          'assets/images/stack3.png',
          'assets/images/stack1.png',
        ]),
  ];
}


class Event{
  final int id;
  final String label;
  final String imageUrl;
  final String address;
  final String details;
  final String openTime;
  final String entryFee;
  final List<String>? detailImages;

  Event({
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