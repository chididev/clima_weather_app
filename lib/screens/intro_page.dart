import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima_weather_app/services/get_location.dart';
import 'package:clima_weather_app/screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var kApiKey = '379ae85fce7b5c035c344d04a556b7c0';
  double? latitude;
  double? longitude;
  var temperature;
  var condition;
  var cityName;
  var country;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    DeviceLocation location = DeviceLocation();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    getWeatherData();

  }

  void getWeatherData() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey'));
    if(response.statusCode == 200){
      String data = response.body;
      var decodedData = jsonDecode(data);
      var temperature = decodedData['main']['temp'];
      var condition = decodedData['weather'][0]['id'];
      var cityName = decodedData['name'];
      var country = decodedData['sys']['country'];
      temperature = temperature;
      condition = condition;
      cityName = cityName;
      country = country;

    }else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //First Tile
              const Expanded(
                flex: 5,
                child: Icon(
                  FontAwesomeIcons.cloudSunRain,
                  size: 200,
                  color: Color(0xFFFEBF2F),
                ),
              ),
              //Second Tile
              const Expanded(
                child: Text(
                  'Discover the Weather in Your City',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Third Tile
              const Expanded(
                child: Text(
                  'Get to know your weather maps and radar precipitation forecast',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              //Fourth Tile
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0095FF),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return  HomePage(
                              temperature: temperature,
                              condition: condition,
                              cityName: cityName,
                              country: country,
                            );
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
