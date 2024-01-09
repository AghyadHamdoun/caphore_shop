import 'package:caphore/features/attributes/domain/entities/terms.dart';
import 'package:caphore/features/attributes/domain/usecases/get_term_products_usecase.dart';
import 'package:caphore/features/attributes/domain/usecases/get_terms_usecase.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:dartz/dartz.dart';
import 'package:caphore/core/error/failure.dart';


abstract class BaseAttributesRepository {


  Future<Either<Failure, List<Term>>> getTerms(TermsParameters parameters);

  Future<Either<Failure, List<Product>>> getTermProducts(TermProductsParameters parameters);




}
