import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/network/error_message_model.dart';
import 'package:caphore/features/categories/data/models/categories_model.dart';
import 'package:caphore/features/categories/data/models/products_model.dart';
import 'package:caphore/core/network/api_constance.dart';

import 'package:dio/dio.dart';
import 'package:flutter_wp_woocommerce/woocommerce.dart';

abstract class BaseCategoriesRemoteDataSource {
  Future<List<ProductModel>> getAllCategoryProducts(int id, int page,int perPage);

  Future<List<ProductModel>> getLastProducts(int pag,int perPage);

  Future<List<CategoryModel>> getAllCategories();

  Future<ProductModel> getProductDetails(int id);
}

class CategoriesRemoteDateSource extends BaseCategoriesRemoteDataSource {
  WooCommerce woocommerce = WooCommerce(
      baseUrl: 'https://caphore.sy',
      consumerKey: 'ck_91cf0556bc93906395a13037c2a179392cb49b58',
      consumerSecret: 'cs_3fe564c516e38ed51dcd7caef07c95baadc4f294');

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    print('request----------');
    final response = await Dio().get(ApiConstance.allCategoriesPath);
    if (response.statusCode == 200) {
      return List<CategoryModel>.from((response.data).map(
        (e) => CategoryModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModel>> getAllCategoryProducts(int id, int page,int perPage) async {
    print('products----------------');
    final response =
        await Dio().get(ApiConstance.allCategoryProductsPath(id, page,perPage));
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
  Future<ProductModel> getProductDetails(int id) async {
    final response = await Dio().get(ApiConstance.oneProductsPath(id));
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<ProductModel>> getLastProducts(int page,int perPage) async {
    final response =
        await Dio().get(ApiConstance.lastProductsPath(page,perPage));
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
}
