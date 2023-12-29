import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  cardTheme: const CardTheme(clipBehavior: Clip.antiAlias),
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData().textTheme,
  ).apply(displayColor: Colors.black),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
  ),
  colorSchemeSeed: Colors.green,
);

var darkTheme = ThemeData(
  cardTheme: const CardTheme(clipBehavior: Clip.antiAlias),
  brightness: Brightness.dark,
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData().textTheme,
  ).apply(displayColor: Colors.white, bodyColor: Colors.white),
);
