import 'package:flutter/material.dart';

import 'features/product/presentation/pages/add_page.dart';
import 'features/product/presentation/pages/edit_page.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/view_page.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // no need for await since init() returns void

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports eCommerce Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'JetBrains Mono',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddPage(),
        '/edit': (context) => const EditPage(),
      },
    );
  }
}
