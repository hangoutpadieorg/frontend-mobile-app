

class EventModel {
  static final events =[
    Event(id: 1, label: 'HARD ROCK', imageUrl: 'assets/images/hard.png'),
    Event(id: 2, label: 'BHEERHUGZ CAFE', imageUrl: 'assets/images/bheer.png'),
    Event(id: 2, label: 'COFFEE ROYALE', imageUrl: 'assets/images/coffee.png'),
    Event(id: 3, label: 'VESTOR\'S CAFE', imageUrl: 'assets/images/cafes.png'),
  ];
}


class Event{
  final int id;
  final String label;
  final String imageUrl;

  Event({
    required this.id,
    required this.label,
    required this.imageUrl,
});
}