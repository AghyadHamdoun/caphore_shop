import 'package:caphore/core/error/failure.dart';
import 'package:caphore/core/usecase/base_usecase.dart';
import 'package:caphore/features/attributes/domain/entities/terms.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_attributes_repository.dart';

class GetTermsUseCase extends BaseUseCase<List<Term>, TermsParameters> {
  final BaseAttributesRepository baseAttributesRepository;

  GetTermsUseCase(this.baseAttributesRepository);

  @override
  Future<Either<Failure, List<Term>>> call(TermsParameters parameters) async {
    return await baseAttributesRepository.getTerms(parameters);
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
