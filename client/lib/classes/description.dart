class Description {
  String? id;
  final List<dynamic> images;
  final String content;
  Description({this.id, required this.images, required this.content});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      id: json["_id"] as String,
      images: json["images"] as List<dynamic>,
      content: json["content"] as String,
    );
  }
}
