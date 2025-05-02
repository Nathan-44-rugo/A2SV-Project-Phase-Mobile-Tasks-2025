import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(product.description),
        trailing: Text('Ksh ${product.price.toStringAsFixed(2)}'),
        onTap: onTap, // Use the passed callback
      ),
    );
  }
}
