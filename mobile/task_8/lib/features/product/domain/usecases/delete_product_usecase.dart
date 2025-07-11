import '../repositories/product_repository.dart';

class DeleteProductUsecase {
  final ProductRepository repository;

  DeleteProductUsecase(this.repository);

  Future<void> call(String id) async{
    repository.deleteProduct(id);
  }
}
