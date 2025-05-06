import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../widgets/header.dart';

class ViewProductPage extends StatefulWidget {
  final Product product;

  const ViewProductPage({super.key, required this.product});

  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  late Product _product;
  static const String placeholder = 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png';

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(_product.description),
              const SizedBox(height: 20),
              const Text(
                'Price:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('\$${_product.price.toStringAsFixed(2)}'),
              const SizedBox(height: 20),
              if (_product.imageUrl.isNotEmpty)
                Image.network(
                  _product.imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      placeholder,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Products'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    '/edit',
                    arguments: _product,
                  );
        
                  if (result == 'deleted') {
                    Navigator.pop(context, 'deleted');
                  } else if (result is Product) {
                    setState(() {
                      _product = result;
                    });
                  }
                },
                child: const Text('Edit Product'),
              )
        
            ],
          ),
        ),
      ),
    );
  }
}
