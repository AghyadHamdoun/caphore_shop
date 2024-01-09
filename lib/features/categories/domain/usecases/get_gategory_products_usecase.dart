import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/products_model.dart';

class GetCategoryProductsUseCase
    extends BaseUseCase<List<ProductModel>, CategoryProductsParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetCategoryProductsUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<ProductModel>>> call(
      CategoryProductsParameters parameters) async {
    return await baseCategoriesRepository.getCategoryProducts(parameters);
  }
}

class CategoryProductsParameters extends Equatable {
  final int categoryId;
  final int page;
  final int perPage;

  const CategoryProductsParameters({required this.categoryId,required this.page,required this.perPage});

  @override
  List<Object?> get props => [categoryId,page,perPage];
}
