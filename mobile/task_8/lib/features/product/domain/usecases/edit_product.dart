import '../entities/product.dart';
import '../repositories/product_repository.dart';

class EditProduct {
  final ProductRepository repository;

  EditProduct(this.repository);

  Future<void> call(Product product) async {
    await repository.editProduct(product);
  }
}
