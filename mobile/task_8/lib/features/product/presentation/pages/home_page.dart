import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../widgets/header.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final getProducts = sl<GetProducts>();
    final products = await getProducts();
    setState(() {
      _products = products;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'All Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: _products[index],
                    onTap: () async {
                      final updated = await Navigator.pushNamed(
                        context,
                        '/view',
                        arguments: _products[index],
                      );
                      if (updated == true) {
                        _loadProducts(); // This will refresh the list
                      }
                    },
                  );

                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((_) => _loadProducts());
        },
        backgroundColor: const Color.fromRGBO(0, 130, 195, 1),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}