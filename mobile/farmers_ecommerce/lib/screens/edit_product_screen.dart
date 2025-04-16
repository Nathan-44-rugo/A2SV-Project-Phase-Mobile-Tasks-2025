import 'package:flutter/material.dart';
import '../model/product.dart';
import '../data/readwrite.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;
  final int index;

  const EditProductScreen({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  List<Product> _allProducts = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.productName);
    _categoryController = TextEditingController(text: widget.product.productCategory);
    _priceController = TextEditingController(text: widget.product.productPrice.toString());
    _descriptionController = TextEditingController(text: widget.product.productDescription);

    _loadAllProducts();
  }


  void _loadAllProducts() async {
    final products = await loadProducts();
    setState(() {
      _allProducts = products;
    });
  }


  void _saveChanges() async {
    final updatedProduct = Product(
        _nameController.text,
        int.tryParse(_priceController.text) ?? 0,
        _categoryController.text,
        _descriptionController.text
    );

    _allProducts[widget.index] = updatedProduct;
    await saveProducts(_allProducts);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white)),
        title: Text("Edit Product", style: TextStyle(fontFamily: "Poppins", color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromRGBO(0, 139, 0, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: (){
                  _saveChanges();
                },
                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color.fromRGBO(0, 139, 0, 1))),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(color: Colors.white),
                )
            )
          ],
        ),
      ),
    );
  }
}
