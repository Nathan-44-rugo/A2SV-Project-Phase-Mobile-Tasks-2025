import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final int index;
  final Function onDelete;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.index,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Color.fromRGBO(0, 139, 0, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${product.productName}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Category: ${product.productCategory}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Price: \$${product.productPrice}", style: TextStyle(fontSize: 18)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: {'product': product, 'index': index},
                    );
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Edit", style: TextStyle(color:Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    onDelete(index);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete),
                  label: Text("Delete", style: TextStyle(color:Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
