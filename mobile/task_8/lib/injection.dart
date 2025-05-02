import 'package:get_it/get_it.dart';
import 'features/product/data/datasources/product_local_datasource.dart';  // Import local data source
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/create_product_usecase.dart';
import 'features/product/domain/usecases/delete_product_usecase.dart';
import 'features/product/domain/usecases/update_product_usecase.dart';
import 'features/product/domain/usecases/view_all_products_usecase.dart';

final sl = GetIt.instance;

void init() {
  // Register LocalDataSource
  sl.registerLazySingleton<ProductLocalDataSource>(() => ProductLocalDataSourceImpl());

  // Register ProductRepository with LocalDataSource
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(localDataSource: sl<ProductLocalDataSource>()));

  // Register use cases
  sl.registerLazySingleton<CreateProductUsecase>(() => CreateProductUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<UpdateProductUsecase>(() => UpdateProductUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<ViewAllProductsUsecase>(() => ViewAllProductsUsecase(sl<ProductRepository>()));
  sl.registerLazySingleton<DeleteProductUsecase>(() => DeleteProductUsecase(sl<ProductRepository>()));
}
