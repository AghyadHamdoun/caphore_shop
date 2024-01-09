import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


class GetCategoriesByParentUseCase
    extends BaseUseCase<List<Category>, CategoriesByParentParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetCategoriesByParentUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<Category>>> call(
      CategoriesByParentParameters parameters) async {
    return await baseCategoriesRepository.getCategoriesByParent(parameters.parent);
  }
}

class CategoriesByParentParameters extends Equatable {
  final int parent;

  const CategoriesByParentParameters({required this.parent});

  @override
  List<Object?> get props => [parent];
}
