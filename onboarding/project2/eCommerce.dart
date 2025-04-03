import "product.dart";
import 'dart:io';

class eCommerce {
  List<Product> productList = [];

  void addProduct(Product product) {
    productList.add(product);
  }

  void viewProducts() {
    if (productList.isEmpty) {
      print("No products available.\n");
    } else {
      for (var product in productList) {
        product.showDetails();
      }
      print("Total products: ${productList.length}\n");
    }
  }

  void printProduct(String? name) {
    if (name == null || name.isEmpty) {
      print("Invalid product name");
    } else {
      bool found = false;
      for (Product product in productList) {
        if (product.name == name) {
          print("Product Found!");
          product.showDetails();
          found = true;
          break;
        }
      }
      if (found == false) {
        print("No such product found!\n");
      }
    }
  }

  void editProduct(String? name) {
    if (name == null || name.isEmpty) {
      print("Invalid product name");
    } else {
      bool found = false;
      for (Product product in productList) {
        if (product.name == name) {
          var [productName, productDesc, productPrice] = editDetails(
            product.name,
            product.description,
            product.price,
          );
          product.name = productName;
          product.description = productDesc;
          product.price = productPrice;
          print("Product Edited!\n");
          found = true;
          break;
        }
      }
      if (found == false) {
        print("Product not found!\n");
      }
    }
  }

  List<dynamic> editDetails(
    String currentName,
    String currentDesc,
    double currentPrice,
  ) {
    print("Enter new product name (leave empty to keep current):");
    String? name = stdin.readLineSync();
    print("Enter new product description (leave empty to keep current):");
    String? desc = stdin.readLineSync();
    print("Enter new product price (leave empty to keep current):");
    String? priceInput = stdin.readLineSync();

    String newName = (name == null || name.isEmpty) ? currentName : name;
    String newDesc = (desc == null || desc.isEmpty) ? currentDesc : desc;
    double newPrice =
        (priceInput == null || priceInput.isEmpty)
            ? currentPrice
            : double.tryParse(priceInput) ?? currentPrice;

    return [newName, newDesc, newPrice];
  }

  void deleteProduct(String? name) {
    if (name == null || name.isEmpty) {
      print("Invalid product name.\n");
      return;
    }

    int initialLength = productList.length;
    productList.removeWhere((product) => product.name == name);

    if (productList.length < initialLength) {
      print("Product Deleted!\n");
    } else {
      print("No such product found.\n");
    }
  }
}
