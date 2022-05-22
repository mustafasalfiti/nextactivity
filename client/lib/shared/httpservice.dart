import 'dart:convert';
import 'package:http/http.dart';
import 'event_model.dart';

class HttpService {
  final String url = 'localhost:3000';

  Future<List<Event>> getEvents() async {
    Response res = await get(url);
    if (res.StatusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Event> events =
          body.map((dynamic event) => Event.fromJson(event)).toList();
          return events
    } else {
      throw "Unable to get Events";
    }
    }
  }
}


