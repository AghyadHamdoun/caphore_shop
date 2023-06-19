import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetSearchProductsUseCase
    extends BaseUseCase<List<Product>, SearchProductsParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetSearchProductsUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<Product>>> call(
      SearchProductsParameters parameters) async {
    return await baseCategoriesRepository.getSearchProducts(parameters);
  }
}

class SearchProductsParameters extends Equatable {
  final String search;
  final int page;
  final int perPage;

  const SearchProductsParameters({required this.search,required this.page,required this.perPage});

  @override
  List<Object?> get props => [search,page,perPage];
}
