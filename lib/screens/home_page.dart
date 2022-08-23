import 'package:clima_weather_app/screens/city_search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima_weather_app/services/weather_condition.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.locationWeather});
  final locationWeather;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel weather = WeatherModel();
  var temperature;
  var weatherMessage;
  var weatherIcon;
  var cityName;
  var country;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  Future<dynamic> updateUI(dynamic weatherData) async {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherMessage =
            'Unable to get weather data at the moment. Please try again shortly';
        weatherIcon = 'Error';
        cityName = 'Error';
        country = 'Error';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weather.getMessage(temperature);
      var condition = weather.getWeatherIcon(weatherData['weather'][0]['id']);
      weatherIcon = condition;
      cityName = weatherData['name'];
      country = weatherData['sys']['country'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.bars),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.locationDot,
              color: Color(0xFF074083),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              '$cityName, $country',
              style: const TextStyle(
                fontFamily: 'EBGaramond',
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //First Tile
          const Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today's Report",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'EBGaramond',
                ),
              ),
            ),
          ),
          //  Second Tile
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$weatherIcon',
                  style: const TextStyle(
                    fontSize: 100,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$temperature °C',
                  style: const TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '$weatherMessage in $cityName, $country.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //  Third Tile
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Icon(
                      FontAwesomeIcons.cloudSunRain,
                      size: 50,
                      color: Color(0xFFFEBF2F),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '23km/h',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Sun',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: const [
                    Icon(
                      FontAwesomeIcons.cloudShowersWater,
                      size: 50,
                      color: Color(0xFFFEBF2F),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '30%',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Humidity',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: const [
                    Icon(
                      FontAwesomeIcons.cloudMoonRain,
                      size: 50,
                      color: Color(0xFFDEE0E0),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '23km/h',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Chance of rain',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //Fourth Tile
          Expanded(
            child: Card(
              color: const Color(0xFF16182A),
              margin: const EdgeInsets.fromLTRB(70, 25, 70, 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      FontAwesomeIcons.rotateLeft,
                      color: Color(0xFF777884),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CitySearchPage();
                          },
                        ),
                      );
                     if(typedName != null){
                       var weatherData = await weather.getCityWeather(typedName);
                       updateUI(weatherData);
                     }
                    },
                    child: const Icon(
                      FontAwesomeIcons.searchengin,
                      color: Color(0xFF777884),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
