import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima_weather_app/screens/home_page.dart';
import 'package:geolocator/geolocator.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  void getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const  BoxDecoration(
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
                       // getLocation();
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) {
                            return const HomePage();
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
