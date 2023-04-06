import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetProductDetailsUseCase
    extends BaseUseCase<Product, ProductDetailsParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetProductDetailsUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, Product>> call(
      ProductDetailsParameters parameters) async {
    return await baseCategoriesRepository.getProductDetails(parameters);
  }
}

class ProductDetailsParameters extends Equatable {
  final int productId;

  const ProductDetailsParameters({required this.productId});

  @override
  List<Object?> get props => [];
}
