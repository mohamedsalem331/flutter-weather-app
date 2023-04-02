import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for ui
  late String time; // location time
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  late bool isDayTime; // day time bool

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      final data = convert.jsonDecode(response.body) as Map<String, dynamic>;

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Request failed Error $e.');
      time = "invalid time request";
    }
  }
}

// give me example on how to use flutter provider with api to display dynamic data in a widget