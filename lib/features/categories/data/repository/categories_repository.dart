import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/error/failure.dart';
import 'package:caphore/features/categories/data/datasource/categories_remote_data_source.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepository extends BaseCategoriesRepository{
  final BaseCategoriesRemoteDataSource baseCategoriesRemoteDataSource;

  CategoriesRepository(this.baseCategoriesRemoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getAllCategories() async {
   final result = await baseCategoriesRemoteDataSource.getAllCategories();
   try {
     return Right(result);
   } on ServerException catch (failure) {
     return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategoryProducts(CategoryProductsParameters parameters) async{
    final result = await baseCategoriesRemoteDataSource.getAllCategoryProducts(parameters.categoryId, parameters.page);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(ProductDetailsParameters parameters) async{
    final result = await baseCategoriesRemoteDataSource.getProductDetails(parameters.productId);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getLastProducts(CategoryProductsParameters parameters) async {
    final result = await baseCategoriesRemoteDataSource.getLastProducts(parameters.page);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }




}