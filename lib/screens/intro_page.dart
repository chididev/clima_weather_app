import 'package:clima_weather_app/services/weather_condition.dart';
import 'package:flutter/material.dart';
import 'package:clima_weather_app/screens/home_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // double? latitude;
  // double? longitude;

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) {
          return HomePage(locationWeather: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                getLocationData();
              });
            },
            child: const Text('Get Started'),
          ),
        ),
      ),
    );
  }
}
