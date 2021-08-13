import 'dart:convert';

import 'package:clima/model/model.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<WeatherModel?> getData() async {
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      var weather = WeatherModel();
      weather.fromJson(jsonDecode(data));
      return weather;
    } else {
      print(response.statusCode);
    }
    return null;
  }
}
