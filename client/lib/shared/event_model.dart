import 'package:flutter/foundation.dart';

class Event {
  final String event_type;
  final String description;
  final String location;

  Event({
    @required this.event_type,
    @required this.description,
    @required this.location,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      event_type: json["event_type"] as String,
      description: json["Description"] as String,
      location: json["location"] as String,
    );
  }
}
