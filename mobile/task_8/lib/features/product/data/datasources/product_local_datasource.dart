import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  List<Product> getProducts();
  Product? getProductById(String id);
  void addProduct(ProductModel product);
  void editProduct(ProductModel product);
  void deleteProduct(String id);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final List<ProductModel> _products = [];

  @override
  List<Product> getProducts() {
    return _products;
  }

  @override
  Product? getProductById(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  @override
  void addProduct(ProductModel product) {
    _products.add(product);
  }

  @override
  void editProduct(ProductModel product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  @override
  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
  }
}
