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
        toolbarHeight: 100,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading:
            IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white,)),
        title: Text("Product Details", style: TextStyle(fontFamily: "Poppins",color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromRGBO(0, 139, 0, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 300,
                maxWidth: 750,
                maxHeight: 350,
              ),
              child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.fromLTRB(10, 25, 10, 0),
                  child:
                    Column(
                      children: [
                        SizedBox(height: 35),
                        Text(product.productName, style: TextStyle(fontSize: 24, fontFamily: "Poppins", fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        SizedBox(height: 25),
                        Text("Price: \$${product.productPrice}", style: TextStyle(fontSize: 20, fontFamily: "Poppins"), textAlign: TextAlign.center,),
                        SizedBox(height: 25),
                        Text("Category: ${product.productCategory}", style: TextStyle(fontSize: 20, fontFamily: "Poppins"), textAlign: TextAlign.center,),
                        SizedBox(height: 25),
                        Text("Description: \n ${product.productDescription}", style: TextStyle(fontSize: 20, fontFamily: "Poppins"), textAlign: TextAlign.center,),
                      ],
                    )
                ),
            ),
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
                  icon: Icon(Icons.edit, color: Colors.white,),
                  label: Text("Edit", style: TextStyle(fontFamily: "Poppins", color:Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    onDelete(index);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete, color: Colors.white),
                  label: Text("Delete", style: TextStyle(fontFamily: "Poppins", color:Colors.white)),
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
