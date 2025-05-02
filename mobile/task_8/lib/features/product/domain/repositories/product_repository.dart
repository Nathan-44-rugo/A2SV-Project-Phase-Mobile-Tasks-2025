import '../entities/product.dart';

abstract class ProductRepository {
  List<Product> getAllProducts();
  Product? getProductById(String id);
  void createProduct(Product product);
  Future<void> updateProduct(Product product);
  void deleteProduct(String id);
}

