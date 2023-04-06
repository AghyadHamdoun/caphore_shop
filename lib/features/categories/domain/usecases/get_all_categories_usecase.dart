import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetAllCategoriesUseCase
    extends BaseUseCase<List<Category>, AllCategoriesParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetAllCategoriesUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<Category>>> call(
      AllCategoriesParameters parameters) async {
    return await baseCategoriesRepository.getAllCategories();
  }
}

class AllCategoriesParameters extends Equatable {


  const AllCategoriesParameters();

  @override
  List<Object?> get props => [];
}
