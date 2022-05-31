import 'dart:convert';
import 'package:client/classes/description.dart';
import 'package:client/classes/location.dart';

class Event {
  String? id;
  final String titel;
  final String eventType;
  final Description description;
  final Location location;
  final List<dynamic> peopleJoined;
  final int peopleRequired;

  Event({
    this.id,
    required this.titel,
    required this.eventType,
    required this.description,
    required this.location,
    required this.peopleJoined,
    required this.peopleRequired,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json["_id"],
      titel: json["titel"] as String,
      eventType: json["event_type"] as String,
      description: Description.fromJson(json["description"]),
      location: Location.fromJson(json["location"]),
      peopleJoined: json["people_joined"] as List<dynamic>,
      peopleRequired: json["people_required"] as int,
    );
  }
  String toJson() => jsonEncode({
        '_id': id,
        'titel': titel,
        'event_type': eventType,
        'people_joined': peopleJoined,
        'people_required': peopleRequired,
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
    return "titel: $titel eventType: $eventType description.content: ${description.content} descritiopn.images: ${description.images} peopleJoined: $peopleJoined peopleRequired: $peopleRequired";
  }
}
