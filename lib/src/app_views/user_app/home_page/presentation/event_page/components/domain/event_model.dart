
class EventModel{
  EventModel({
    required this.id,
    required this.category,
    required this.name,
    required this.imageCover,
});

  final int id;
  final String category;
  final String name;
  final String imageCover;

  // factory EventK.fromJson(Map<String, dynamic> map){
  //
  // }
}