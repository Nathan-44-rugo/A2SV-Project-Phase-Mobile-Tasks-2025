import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<void> addProduct(Product product);
  Future<void> editProduct(Product product);
}
