import 'package:clima_weather_app/screens/city_search_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.bars),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              FontAwesomeIcons.locationDot,
              color: Color(0xFF074083),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'location, Nigeria',
              style: TextStyle(
                fontFamily: 'EBGaramond',
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.city,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return const CitySearchPage();
                  },
                ),
              );
            },
          )
        ],
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
              children: const [
                Icon(
                  FontAwesomeIcons.cloudSun,
                  size: 150,
                  color: Color(0xFFFEBF2F),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "It's Sunny",
                  style: TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '29 C',
                  style: TextStyle(
                    fontFamily: 'EBGaramond',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
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
          Expanded(child: Card(
            color: const Color(0xFF16182A),
            margin: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const[
                Icon(FontAwesomeIcons.house, color: Color(0xFF777884),),
                Icon(FontAwesomeIcons.searchengin, color: Color(0xFF777884),),
                Icon(FontAwesomeIcons.mapLocation, color: Color(0xFF777884),),
                Icon(FontAwesomeIcons.user, color: Color(0xFF777884),),
              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
