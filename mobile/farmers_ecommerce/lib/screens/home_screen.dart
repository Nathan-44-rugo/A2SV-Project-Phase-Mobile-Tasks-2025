import 'package:flutter/material.dart';
import '../model/product.dart';
import '../data/readwrite.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    List<Product> loaded = await loadProducts();
    setState(() {
      _products = loaded;
    });
  }

  void _deleteProduct(int index) async {
    setState(() {
      _products.removeAt(index);
    });
    await saveProducts(_products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Center(
          child: Text(
            "Welcome to the \nFarmer's eCommerce Platform",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 139, 0, 1),
      ),
      body: _products.isEmpty
          ? const Center(child: Text("No products yet."))
          : ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final p = _products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(p.productName),
              subtitle: Text(p.productCategory),
              trailing: Text('\$${p.productPrice}'),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(
                      product: p,
                      index: index,
                      onDelete: _deleteProduct,
                    ),
                  ),
                );
                _loadProducts(); // refresh after detail screen
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          _loadProducts(); // refresh after adding
        },
        backgroundColor: const Color.fromRGBO(0, 139, 0, 1),
        child: const Icon(Icons.add),
      ),
    );
  }
}
