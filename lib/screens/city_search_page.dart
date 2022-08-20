import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({Key? key}) : super(key: key);

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
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
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                suffixIcon: Container(
                  child: const Icon(
                    FontAwesomeIcons.searchengin,
                    color: Colors.grey,
                  ),
                ),
                suffixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                icon: const Icon(
                  FontAwesomeIcons.city,
                  color: Colors.white,
                ),
                hintText: 'Enter City Name',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
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
                onPressed: () {
                  Navigator.pop(context);
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
