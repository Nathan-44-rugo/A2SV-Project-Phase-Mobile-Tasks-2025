import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/add_screen.dart';
import 'screens/edit_product_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Farmer's eCommerce",
      initialRoute: "/", // Screen that appears app is run
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddScreen(),
        '/edit': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return EditProductScreen(
            product: args['product'],
            index: args['index'],
          );
        },
      },
    )
  );
}
