import 'dart:convert';
import 'package:client/classes/description.dart';
import 'package:client/classes/location.dart';

class Post {
  String? id;
  final String userId;
  final Description description;
  final Location location;
  final List<dynamic>? comments;

  Post({
    this.id,
    required this.userId,
    required this.description,
    required this.location,
    this.comments,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    print(json);
    return Post(
      id: json["_id"],
      userId: json["user_id"] as String,
      description: Description.fromJson(json["description"]),
      location: Location.fromJson(json["location"]),
      comments: json["comments"] as List<dynamic>,
    );
  }
  String toJson() => jsonEncode({
        '_id': id,
        'user_id': userId,
        'comments': comments,
        "description": {
          'content': description.content,
          "images": description.images
        },
        "location": {
          "coordinates": location.coordinates,
          "type": location.type
        },
      });

  @override
  String toString() {
    return "id userId: $userId description.content: ${description.content} descritiopn.images: ${description.images} comments: $comments";
  }
}
