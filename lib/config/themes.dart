import 'package:flutter/material.dart';

ThemeData themeBlue = ThemeData(
    primarySwatch: Colors.blueGrey,
    primaryColor: Colors.red,
    canvasColor: Colors.white,
    cardColor: Colors.white,
    shadowColor: Colors.blueAccent,
    visualDensity: VisualDensity.comfortable,
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black,
        labelPadding: EdgeInsets.all(5),
        unselectedLabelColor: Colors.blueGrey,
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
    fontFamily: "Times");
