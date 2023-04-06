import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:dartz/dartz.dart';

import 'package:caphore/core/error/failure.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:flutter/foundation.dart';

abstract class BaseCategoriesRepository {
  Future<Either<Failure, List<Product>>> getCategoryProducts(CategoryProductsParameters parameters);

  Future<Either<Failure, Product>> getProductDetails(ProductDetailsParameters parameters);

  Future<Either<Failure, List<Category>>> getAllCategories();
}
