import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategory = '';
  double selectedPrice = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Category", style: TextStyle(fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            TextField(
              onChanged: (val) => selectedCategory = val,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Price", style: TextStyle(fontWeight: FontWeight.w600)),
            Slider(
              value: selectedPrice,
              min: 0,
              max: 200,
              divisions: 10,
              label: '\$${selectedPrice.toInt()}',
              onChanged: (value) {
                setState(() {
                  selectedPrice = value;
                });
              },
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Pass filter data back
                  Navigator.pop(context, {
                    'category': selectedCategory,
                    'price': selectedPrice,
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Color(0xFF3D5AFE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("APPLY"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
