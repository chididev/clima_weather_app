import 'package:flutter/material.dart';
import 'package:clima_weather_app/reuseable/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({Key? key}) : super(key: key);

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 80,
            ),
            TextField(
              onChanged: (value) {
                cityName = value;
              },
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: kTextFielddecoration,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(100, 18, 100, 18),
              decoration: const BoxDecoration(
                color: Color(0xFF0095FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: TextButton(
                onPressed: () async {
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
