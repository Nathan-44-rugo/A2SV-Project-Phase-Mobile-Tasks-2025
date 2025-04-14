import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_screen.dart';
import 'screens/view_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Farmer's eCommerce",
      initialRoute: "/",
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddScreen(),
        '/view': (context) => ViewScreen(),
      },
    )
  );
}
