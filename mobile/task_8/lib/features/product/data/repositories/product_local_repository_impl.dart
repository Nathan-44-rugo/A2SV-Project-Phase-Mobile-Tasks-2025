import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductLocalRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  final ProductRemoteDataSource remoteDataSource;

  ProductLocalRepositoryImpl({required this.localDataSource, required this.remoteDataSource});

  @override
  List<Product> getAllProducts() {
    return localDataSource.getProducts();
  }

  @override
  Product? getProductById(String id) {
    return localDataSource.getProductById(id);
  }

  @override
  void createProduct(Product product) {
    final model = ProductModel(
      id: product.id,
      imageUrl: product.imageUrl,
      name: product.name,
      description: product.description,
      price: product.price,
    );
    localDataSource.addProduct(model);
  }

  @override
  Future<void> updateProduct(Product product) async {
    final model = ProductModel(
      id: product.id,
      imageUrl: product.imageUrl,
      name: product.name,
      description: product.description,
      price: product.price,
    );
    localDataSource.editProduct(model);
  }

  @override
  Future<void> deleteProduct(String id) async{
    localDataSource.deleteProduct(id);
  }
}
