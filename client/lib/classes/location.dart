class Location {
  String? id;
  String type;
  List<dynamic> coordinates;

  Location({this.id, required this.coordinates, required this.type});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json["_id"] as String,
      type: json["type"] as String,
      coordinates: json["coordinates"] as List<dynamic>,
    );
  }
}
