import 'package:flutter/material.dart';
import 'package:flutterkit/telas/inicial-menu.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.dark,
    debugShowCheckedModeBanner: false,
  ));
}



