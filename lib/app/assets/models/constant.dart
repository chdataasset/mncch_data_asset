// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BaseUrl {
  // static const Baseurl = 'https://flutter.ramarumah.id/flutter/';
  static const kLoginUrl = 'https://flutter.ramarumah.id/login.php';
  static const kRegisterURL = 'https://flutter.ramarumah.id/register.php';
  static const cBaseUrl = "https://jumdbwppzvzgfyyseoia.supabase.co";
  static const cAnonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp1bWRid3BwenZ6Z2Z5eXNlb2lhIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTI5Mzc5NDIsImV4cCI6MTk2ODUxMzk0Mn0.Mmny5lslBs4SoC0s0PI8gmsjKyYkSwA7RRfvLwmBqUQ";
}

Color kLightgreen = Color(0xFFB2DBBF);
Color kDarkerGreen = Color(0xFF70c1B3);
Color kYellow = Color(0xFFF3FFBD);
Color kWhite = Color.fromARGB(255, 207, 206, 206);
Color kDarkBlue = Colors.blue.shade900;
Color kLightBlue = Colors.blue.shade50;

InputDecoration kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
  filled: true,
  fillColor: Color.fromRGBO(255, 255, 255, 0.3),
  focusColor: Colors.black,
  hintText: '',
  hintStyle:
      TextStyle(color: Colors.blue.shade300, fontWeight: FontWeight.w800),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kWhite, width: 3.0),
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
    borderSide: BorderSide(color: kWhite, width: 3.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
    borderSide: BorderSide(color: Colors.transparent, width: 3.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15),
    ),
    borderSide: BorderSide(color: Colors.green, width: 3.0),
  ),
);

var Placeholder = SizedBox(
  width: double.infinity,
  height: 150,
  child: Image.asset('dummyimage.png'),
);

dynamic kDecorPurple = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.white, Colors.black45],
  ),
);
