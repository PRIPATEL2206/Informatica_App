import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
    inputDecorationTheme: const InputDecorationTheme(
  prefixIconColor: Colors.orange,
));
final ThemeData lightTheme = ThemeData(primarySwatch: Colors.orange).copyWith(
    inputDecorationTheme: const InputDecorationTheme(
  prefixIconColor: Colors.black,
));

final test = ThemeData(
    indicatorColor: Colors.orange,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.orange,
        titleSpacing: 10.0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 23,
        )),
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Colors.orange,
      prefixIconColor: Colors.orange,
    ));
