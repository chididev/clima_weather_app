import 'package:flutter/material.dart';
import 'package:clima_weather_app/screens/intro_page.dart';
// import 'package:clima_weather_app/screens/home_page.dart';
// import 'package:clima_weather_app/screens/city_search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0B0C1E),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B0C1E),
        ),
      ),
      home: const IntroPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const IntroPage(),
      //   '/first': (context) => const HomePage(),
      //   '/second': (context) => const CitySearchPage(),
      // },
    );
  }
}
