// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag = "";
  String? url = "Asia/Dhaka";
  bool isDay = false;

  WorldTime({this.location = "", this.flag = "", this.url});

  Future<void> getTime() async {
    try {
      print("Loading...");

      var url = Uri.https('www.worldtimeapi.org', '/api/timezone/${this.url}');
      var response = await http.get(url);
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print(jsonResponse);

      String datetime = jsonResponse['datetime'];
      String offset = jsonResponse['utc_offset'].substring(1, 3);

      print("datetime = ${datetime}");
      print("offset = ${offset}");

      // ! Create datetime object
      DateTime now = DateTime.parse(datetime);
      print("now = ${now}");
      now = now.add(Duration(hours: int.parse(offset)));

      isDay = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print("Exception: $e");
      time = "Failed to get time data.";
    }
  }
}
