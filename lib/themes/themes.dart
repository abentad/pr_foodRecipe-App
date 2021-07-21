import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.black,
    hintColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xffFAFCFE),
    textTheme: TextTheme(
      //on light backgrounds use this
      bodyText1: TextStyle(color: Colors.white),
      //on dark backgrounds use this
      bodyText2: GoogleFonts.montserrat(color: Colors.black),
    ),
    accentColor: Colors.teal,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
    hintColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Color(0xff121212),
    textTheme: TextTheme(
      //on light backgrounds use this
      bodyText1: TextStyle(color: Colors.black),
      //on dark backgrounds use this
      // bodyText2: TextStyle(color: Colors.white),
      bodyText2: GoogleFonts.montserrat(color: Colors.white),
    ),
    accentColor: Colors.teal,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
    ),
  );
}
