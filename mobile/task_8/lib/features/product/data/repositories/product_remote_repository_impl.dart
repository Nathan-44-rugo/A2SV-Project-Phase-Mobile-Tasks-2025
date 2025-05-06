import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_datasource.dart';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.localDataSource, required this.remoteDataSource});

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
    final model = ProductModel.fromEntity(product);
    localDataSource.addProduct(model);
    remoteDataSource.addProduct(model); // Sync with backend
  }

  @override
  Future<void> updateProduct(Product product) async {
    final model = ProductModel.fromEntity(product);
    localDataSource.editProduct(model);
    await remoteDataSource.updateProduct(model); // Sync with backend
  }

  @override
  Future<void> deleteProduct(String id) async {
    localDataSource.deleteProduct(id);
    await remoteDataSource.deleteProduct(id); // Sync with backend
  }
}
