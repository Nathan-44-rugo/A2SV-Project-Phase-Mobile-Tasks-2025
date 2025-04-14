import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar:
          AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
                  icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white)
              ),
              toolbarHeight: 100,
              title:
              Center(
                child:
                Text(
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
        child:
          Form(
              key: _formKey,
              child: 
                Container(
                  padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
                  child:
                  Column(
                    spacing: 50,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Name of product",
                          border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Price of product",
                            border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Description",
                            border: OutlineInputBorder()
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 139, 0, 1)
                            )
                        ),
                      ),
                  ],
                )
          ),
          ),
      ),
    );
  }
}
