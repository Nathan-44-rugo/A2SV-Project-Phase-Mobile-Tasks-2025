import 'package:flutter/material.dart';
import '../model/product.dart'; // adjust path if needed
import '../data/readwrite.dart';         // your file where save/load functions are

class AddScreen extends StatefulWidget {
  AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      Product newProduct = Product(
        _nameController.text,
        int.parse(_priceController.text),
        _categoryController.text,
        _descriptionController.text,
      );

      List<Product> existingProducts = await loadProducts();
      existingProducts.add(newProduct);
      await saveProducts(existingProducts);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product Saved!')),
      );

      Navigator.pop(context); // go back to previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white)),
        toolbarHeight: 100,
        title: Center(
          child: Text(
            "Add New Product",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Color.fromRGBO(0, 139, 0, 1),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: "Name of product",
                      border: OutlineInputBorder()),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter product name' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(
                      labelText: "Price of product",
                      border: OutlineInputBorder()),
                  keyboardType: TextInputType.number,
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter product price' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                      labelText: "Category", border: OutlineInputBorder()),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter category' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder()),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Enter description' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _handleSubmit,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Color.fromRGBO(0, 139, 0, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
