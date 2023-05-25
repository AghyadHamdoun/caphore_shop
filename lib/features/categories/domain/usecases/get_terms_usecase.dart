import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/categories/domain/entities/terms.dart';
import 'package:caphore/features/categories/domain/repository/base_categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetTermsUseCase extends BaseUseCase<List<Term>, TermsParameters> {
  final BaseCategoriesRepository baseCategoriesRepository;

  GetTermsUseCase(this.baseCategoriesRepository);

  @override
  Future<Either<Failure, List<Term>>> call(TermsParameters parameters) async {
    return await baseCategoriesRepository.getTerms(parameters);
  }
}

class TermsParameters extends Equatable {
  final int id;
  final int perPage;
  final int page;

  const TermsParameters(
      {required this.id, required this.perPage, required this.page});

  @override
  List<Object?> get props => [id,perPage,page];
}
