import 'package:get_it/get_it.dart';
import 'features/product/data/datasources/product_local_datasource.dart';  // Import local data source
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/add_product.dart';
import 'features/product/domain/usecases/edit_product.dart';
import 'features/product/domain/usecases/get_products.dart';

final sl = GetIt.instance;

void init() {
  // Register LocalDataSource
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());

  // Register ProductRepository with LocalDataSource
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(localDataSource: sl<ProductLocalDataSource>()));

  // Register use cases
  sl.registerLazySingleton<AddProduct>(() => AddProduct(sl<ProductRepository>()));
  sl.registerLazySingleton<EditProduct>(() => EditProduct(sl<ProductRepository>()));
  sl.registerLazySingleton<GetProducts>(() => GetProducts(sl<ProductRepository>()));
}
