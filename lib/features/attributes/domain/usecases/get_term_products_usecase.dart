import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/attributes/domain/repository/base_attributes_repository.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTermProductsUseCase
    extends BaseUseCase<List<Product>, TermProductsParameters> {
  final BaseAttributesRepository baseAttributeRepository;

  GetTermProductsUseCase(this.baseAttributeRepository);

  @override
  Future<Either<Failure, List<Product>>> call(
      TermProductsParameters parameters) async {
    return await baseAttributeRepository.getTermProducts(parameters);
  }
}

class TermProductsParameters extends Equatable {
  final String attribute;
  final int termId;
  final int page;
  final int perPage;

  const TermProductsParameters({required this.attribute,required this.termId,required this.page,required this.perPage});

  @override
  List<Object?> get props => [attribute,termId,page,perPage];
}
