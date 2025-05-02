import 'package:flutter/material.dart';

import '../../../../injection.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';
import '../widgets/header.dart';

class EditPage extends StatefulWidget {
  final Product product;

  const EditPage({super.key, required this.product});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _priceController = TextEditingController(text: widget.product.price.toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (_formKey.currentState!.validate()) {
      final updatedProduct = Product(
        id: widget.product.id,
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        imageUrl: widget.product.imageUrl,
      );

      await sl<UpdateProductUsecase>().call(updatedProduct);
      Navigator.pop(context, updatedProduct);
    }
  }

  Future<void> _deleteProduct() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
        ],
      ),
    );

    if (confirmed == true) {
      await sl<DeleteProductUsecase>().call(widget.product.id);
      Navigator.pop(context, 'deleted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Product',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter a name' : null,
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (val) => val == null || val.isEmpty ? 'Enter a description' : null,
                  ),
                  TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Price'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    validator: (val) {
                      final parsed = double.tryParse(val ?? '');
                      if (parsed == null || parsed <= 0) {
                        return 'Enter a valid price';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _saveChanges,
                    child: const Text('Save Changes'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _deleteProduct,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Delete'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
