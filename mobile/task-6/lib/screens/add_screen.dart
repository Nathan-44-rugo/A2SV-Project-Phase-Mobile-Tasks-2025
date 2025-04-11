import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Center(
          child:
            Text(
              "Add product",
              style: TextStyle(
                fontFamily: "Poppins"
              )
                ),
        )
      ),
      body:
          Center(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                ],
              )
          )
    );
  }
}
