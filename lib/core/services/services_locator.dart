import 'package:caphore/features/attributes/data/datasource/attributes_remote_data_source.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/data/datasource/categories_remote_data_source.dart';
import 'package:caphore/features/categories/data/repository/categories_repository.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_last_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/attributes/domain/usecases/get_terms_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => CategoriesBloc(sl(), sl(), sl(),sl()));

    sl.registerFactory(() => AttributesBloc(sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));
    sl.registerLazySingleton(() => GetCategoryProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetProductDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetLastProductsUseCase(sl()));
    sl.registerLazySingleton(() => GetTermsUseCase(sl()));


    /// Repository
    sl.registerLazySingleton<BaseCategoriesRepository>(
        () => CategoriesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(
        () => CategoriesRemoteDateSource());

    sl.registerLazySingleton<BaseAttributesRemoteDataSource>(
            () => AttributesRemoteDateSource());

  }
}
