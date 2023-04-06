import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetCategoryProductsUseCase
    extends BaseUseCase<List<Product>, CategoryProductsParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetCategoryProductsUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<Product>>> call(
      CategoryProductsParameters parameters) async {
    return await baseCategoriesRepository.getCategoryProducts(parameters);
  }
}

class CategoryProductsParameters extends Equatable {
  final int categoryId;
  final int page;

  const CategoryProductsParameters({required this.categoryId,required this.page});

  @override
  List<Object?> get props => [categoryId,page];
}
