import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/error/failure.dart';
import 'package:caphore/features/attributes/domain/repository/base_attributes_repository.dart';
import 'package:caphore/features/attributes/domain/entities/terms.dart';
import 'package:caphore/features/attributes/domain/usecases/get_terms_usecase.dart';
import 'package:dartz/dartz.dart';

import '../datasource/attributes_remote_data_source.dart';

class AttributesRepository extends BaseAttributesRepository{
  final BaseAttributesRemoteDataSource baseAttributesRemoteDataSource;

  AttributesRepository(this.baseAttributesRemoteDataSource);

  @override
  Future<Either<Failure, List<Term>>> getTerms(TermsParameters parameters) async {
    final result = await baseAttributesRemoteDataSource.getTerms(id: parameters.id, page: parameters.page, perPage: parameters.perPage);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }




}