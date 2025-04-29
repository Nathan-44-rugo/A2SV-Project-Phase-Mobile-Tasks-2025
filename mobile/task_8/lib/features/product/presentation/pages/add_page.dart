import 'package:flutter/material.dart';
import '../../../../injection.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/add_product.dart';
import '../widgets/header.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '', description = '';
  double price = 0.0;

  // Simple method to generate unique ID
  String generateUniqueId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (val) => name = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onChanged: (val) => description = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                onChanged: (val) => price = double.tryParse(val) ?? 0.0,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final id = generateUniqueId(); // Use generated ID
                    final newProduct = Product(
                      id: id,
                      name: name,
                      description: description,
                      price: price,
                    );
                    await sl<AddProduct>().call(newProduct);
                    Navigator.pop(context); // go back to home
                  }
                },
                child: const Text('Add Product'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
