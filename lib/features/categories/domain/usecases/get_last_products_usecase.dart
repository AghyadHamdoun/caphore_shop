import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'get_gategory_products_usecase.dart';

class GetLastProductsUseCase
    extends BaseUseCase<List<Product>, CategoryProductsParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetLastProductsUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<Product>>> call(
      CategoryProductsParameters parameters) async {
    return await baseCategoriesRepository.getLastProducts(parameters);
  }
}


