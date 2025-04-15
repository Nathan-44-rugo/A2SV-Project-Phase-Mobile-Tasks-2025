import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import '../model/product.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  print(path);
  return File('$path/products.json');
}

Future<void> saveProducts(List<Product> products) async {
  final file = await _localFile;
  final jsonString = jsonEncode(products.map((p) => p.toJson()).toList());
  await file.writeAsString(jsonString);
}

Future<List<Product>> loadProducts() async {
  try {
    final file = await _localFile;
    final contents = await file.readAsString();
    List<dynamic> jsonData = jsonDecode(contents);
    return jsonData.map((json) => Product.fromJson(json)).toList();
  } catch (e) {
    return [];
  }
}

