import 'package:flutter/material.dart';
import 'features/product/domain/entities/product.dart';
import 'features/product/presentation/pages/add_page.dart';
import 'features/product/presentation/pages/edit_page.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'features/product/presentation/pages/view_product.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/view') {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (context) => ViewProductPage(product: product),
          );
        }

        if (settings.name == '/edit') {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (context) => EditPage(product: product),
          );
        }

        // Fallback if no matching route is found
        return MaterialPageRoute(builder: (context) => const HomePage());
      },
    );
  }
}
