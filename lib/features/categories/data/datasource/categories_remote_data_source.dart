import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/network/error_message_model.dart';
import 'package:caphore/features/categories/data/models/categories_model.dart';
import 'package:caphore/features/categories/data/models/products_model.dart';
import 'package:dio/dio.dart';

import 'package:caphore/core/network/api_constance.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';

abstract class BaseCategoriesRemoteDataSource {

  Future<List<ProductModel>> getAllCategoryProducts(int id,int page);

  Future<List<CategoryModel>> getAllCategories();

  Future<ProductModel> getProductDetails(int id);

}

class CategoriesRemoteDateSource extends BaseCategoriesRemoteDataSource{
  @override
  Future<List<CategoryModel>> getAllCategories() async{
    final response = await Dio().get(ApiConstance.allCategoriesPath);
    if (response.statusCode == 200) {
      return List<CategoryModel>.from((response.data as List).map(
            (e) => CategoryModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ProductModel>> getAllCategoryProducts(int id,int page)async {
    final response = await Dio().get(ApiConstance.allCategoryProductsPath(id, page));
    if (response.statusCode == 200) {
      return List<ProductModel>.from((response.data as List).map(
            (e) => ProductModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<ProductModel> getProductDetails(int id) async{
    final response = await Dio().get(ApiConstance.oneProductsPath(id));
    if (response.statusCode == 200) {
      return response.data;

    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


}