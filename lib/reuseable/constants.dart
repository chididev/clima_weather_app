import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kTextFielddecoration = InputDecoration(
  suffixIcon: Icon(
    FontAwesomeIcons.searchengin,
    color: Colors.grey,
  ),
  suffixIconColor: Colors.black,
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    FontAwesomeIcons.city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle:  TextStyle(color: Colors.grey),
  border:  OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    borderSide: BorderSide.none,
  ),
);