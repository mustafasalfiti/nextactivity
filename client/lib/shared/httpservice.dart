import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

class HttpService {
  final Uri url = Uri.parse('http://localhost:3000/api/event/test');

  Future getEvents() async {
    var res = await http.get(url);
    if (res.statusCode == 200) {
      print(res);
      return null;
    } else {
      throw "Unable to get Events";
    }
  }
}
