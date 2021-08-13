import 'package:clima/model/model.dart';
import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';

const API_KEY = "0f99aeeecb222c6f58742dab2ef40cd5";
const url = "https://api.openweathermap.org/data/2.5/weather?";

class WeatherController {
  Future<WeatherModel?> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    double lat = location.latitude;
    double long = location.longitude;

    NetworkHelper network =
        NetworkHelper("${url}lat=$lat&lon=$long&units=metric&appid=$API_KEY");
    WeatherModel? weather = await network.getData();
    return weather;
  }
}
