class Description {
  final List<String> images;
  final String content;
  Description({required this.images, required this.content});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(
      images: json["description"]["images"] as List<String>,
      content: json["content"]["content"] as String,
    );
  }
}
