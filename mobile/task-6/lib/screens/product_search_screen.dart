import 'package:flutter/material.dart';
import 'package:task_6/screens/home_screen.dart';
import '../widgets/product_card.dart';
import 'filter_screen.dart';
import '../data/dummy_data.dart';


class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({super.key});

  @override
  State<ProductSearchPage> createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  String? selectedCategory;
  double? selectedPrice;

  @override
  Widget build(BuildContext context) {
    // Filter logic
    final filteredProducts = dummyProducts.where((product) {
      final matchesPrice = selectedPrice == null || product.price <= selectedPrice!;
      final matchesCategory = selectedCategory == null ||
          selectedCategory!.isEmpty ||
          product.category.toLowerCase().contains(selectedCategory!.toLowerCase());
      return matchesPrice && matchesCategory;
    }).toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search + Filter Bar
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Leather',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_alt),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FilterScreen(),
                        ),
                      );

                      if (result != null) {
                        setState(() {
                          selectedCategory = result['category'];
                          selectedPrice = result['price'];
                        });
                      }
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Show selected filters
              if (selectedCategory != null || selectedPrice != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (selectedCategory != null && selectedCategory!.isNotEmpty)
                        Text("Category: $selectedCategory"),
                      if (selectedPrice != null)
                        Text("Max Price: \$${selectedPrice!.toInt()}"),
                    ],
                  ),
                ),

              // Product list
              if (filteredProducts.isEmpty)
                Text("No products match your filter."),
              ...filteredProducts.map((product) => ProductCard(product: product)),
            ],
          ),
        ),
      ),
    );
  }
}
