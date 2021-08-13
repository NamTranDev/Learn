import 'dart:ffi';

import 'package:clima/model/model.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print("initState()");
    getLocationData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies()");
  }

  @override
  Widget build(BuildContext context) {
    print("build()");
    return Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LoadingScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    print("deactivate()");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose()");
    super.dispose();
  }

  Future<void> getLocationData() async {
    WeatherController weather = WeatherController();
    WeatherModel? weatherData = await weather.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }
}
