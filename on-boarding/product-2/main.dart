import "dart:io";
import "product.dart";
import "eCommerce.dart";

void homeScreen() {
  print("WELCOME TO THE A2SV eCOMMERCE PLATFORM \n");
  print("Select an integer (1-6) to perform the correspoding task:");
  print("1. Add new list");
  print("2. View all products");
  print("3. View a specific product's details");
  print("4. Edit a specific product's details");
  print("5. Delete a specific product");
  print("Any other key to exit\n");
}

void main() {
  eCommerce management = eCommerce();
  bool isRunning = true;
  while (isRunning) {
    homeScreen();
    var input = stdin.readLineSync();
    switch (input) {
      case "1":
        print("Enter product name");
        var name = stdin.readLineSync()!;
        print("Enter product description");
        var description = stdin.readLineSync()!;
        print("Enter product price");
        var price = double.parse(stdin.readLineSync()!);
        Product product = Product(name, description, price);
        management.addProduct(product);
        print("Product Added\n");
      case "2":
        management.viewProducts();
      case "3":
        print("Enter product name");
        var name = stdin.readLineSync();
        management.printProduct(name);
      case "4":
        print("Enter product name");
        var name = stdin.readLineSync();
        management.editProduct(name);
      case "5":
        print("Enter product name");
        var name = stdin.readLineSync();
        management.deleteProduct(name);
      default:
        isRunning = false;
    }
  }
}
