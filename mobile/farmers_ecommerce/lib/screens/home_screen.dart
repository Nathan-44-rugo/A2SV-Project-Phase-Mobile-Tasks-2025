import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        title:
          Center(
                child:
                  Text(
                      "Welcome to the \n Farmer's eCommerce Platform",
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
      body:
          SingleChildScrollView(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Create a cards from product list
              ],
            )
          ),
      floatingActionButton:
        FloatingActionButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/add'),
            elevation: 4,
            backgroundColor: Color.fromRGBO(0, 139, 0, 1),
            foregroundColor: Colors.white,
            child:
              Icon(Icons.add)
        ),

    );
  }
}
