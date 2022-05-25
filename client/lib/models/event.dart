import 'dart:convert';
import 'package:client/classes/description.dart';
import 'package:client/classes/location.dart';

class Event {
  final String titel;
  final String eventType;
  final Description description;
  final Location location;
  final List<String> peopleJoined;
  final int peopleRequired;

  Event({
    required this.titel,
    required this.eventType,
    required this.description,
    required this.location,
    required this.peopleJoined,
    required this.peopleRequired,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      titel: json["titel"] as String,
      eventType: json["event_type"] as String,
      description: json["description"] as Description,
      location: json["location"] as Location,
      peopleJoined: json["people_joined"] as List<String>,
      peopleRequired: json["people_required"] as int,
    );
  }
  String toJson() => jsonEncode({
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
