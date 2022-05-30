class Location {
  final String type;
  final List<double> coordinates;
  Location({required this.coordinates, required this.type});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["location"]["type"] as String,
      coordinates: json["location"]["coordinbates"] as List<double>,
    );
  }
}
