class WeatherModel {
  List<Weather> weather = [];
  Main? main;
  var name;

  fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }

    main = json['main'] != null ? new Main.fromJson(json['main']) : null;

    name = json['name'];
  }

  String getTempt() {
    if (main?.temp is double) {
      return (main!.temp as double).toStringAsFixed(0) + "°";
    } else {
      return "0°";
    }
  }

  String getWeatherIcon() {
    if (main?.temp < 300) {
      return '🌩';
    } else if (main?.temp < 400) {
      return '🌧';
    } else if (main?.temp < 600) {
      return '☔️';
    } else if (main?.temp < 700) {
      return '☃️';
    } else if (main?.temp < 800) {
      return '🌫';
    } else if (main?.temp == 800) {
      return '☀️';
    } else if (main?.temp <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

class Weather {
  var id;
  var main;
  var description;
  var icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}

class Main {
  var temp;
  var feelsLike;
  var tempMin;
  var tempMax;
  var pressure;
  var humidity;

  Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temp'] = this.temp;
    data['feels_like'] = this.feelsLike;
    data['temp_min'] = this.tempMin;
    data['temp_max'] = this.tempMax;
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    return data;
  }
}
