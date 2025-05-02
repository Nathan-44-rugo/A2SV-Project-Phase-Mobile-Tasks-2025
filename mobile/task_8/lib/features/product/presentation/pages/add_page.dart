import 'package:flutter/material.dart';
import '../../../../injection.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/create_product_usecase.dart';
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
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter product name' : null,
                onChanged: (val) => name = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter product description'
                    : null,
                onChanged: (val) => description = val,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final parsed = double.tryParse(value ?? '');
                  if (parsed == null || parsed <= 0) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
                onChanged: (val) => price = double.tryParse(val) ?? 0.0,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final id = generateUniqueId();
                    final newProduct = Product(
                      id: id,
                      name: name,
                      description: description,
                      price: price,
                      imageUrl: '', // Add logic later to upload/select image
                    );
                    sl<CreateProductUsecase>().call(newProduct);
                    Navigator.pop(context);
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
