
import 'package:caphore/features/categories/data/datasource/categories_remote_data_source.dart';
import 'package:caphore/features/categories/data/repository/categories_repository.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => CategoriesBloc(sl()));


    /// Use Cases
    sl.registerLazySingleton(() => GetAllCategoriesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseCategoriesRepository>(
            () => CategoriesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(
            () => CategoriesRemoteDateSource());
  }
}
