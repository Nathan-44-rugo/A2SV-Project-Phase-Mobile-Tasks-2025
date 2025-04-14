import 'package:flutter/material.dart';
import 'package:task_6/screens/add_productscreen.dart';
import 'package:task_6/screens/product_search_screen.dart';
import '../data/dummy_data.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("July 14, 2023", style: TextStyle(fontSize: 16)),
                  Row(
                    children: <Widget>[
                      Text("Hello", style: TextStyle(fontSize: 24)),
                      SizedBox(width: 5),
                      Text("Nathan", style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              Spacer(),
              Icon(Icons.notifications_none, color: Colors.black87),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Available Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Spacer(),
                  IconButton(onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductSearchPage())
                  ),
                      icon: Icon(Icons.search, size: 35, color: Colors.grey)),
                ],
              ),
            ),
            ...dummyProducts.map((product) => ProductCard(product: product)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => AddProductScreen())
        ),
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
