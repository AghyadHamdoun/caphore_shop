import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/network/error_message_model.dart';
import 'package:caphore/core/network/api_constance.dart';
import 'package:caphore/features/attributes/data/models/terms_model.dart';
import 'package:dio/dio.dart';

abstract class BaseAttributesRemoteDataSource {
  Future<List<TermModel>> getTerms(
      {required int id, required int page, required int perPage});
}

class AttributesRemoteDateSource extends BaseAttributesRemoteDataSource {
  @override
  Future<List<TermModel>> getTerms(
      {required int id, required int page, required int perPage}) async {
    print('terms----------------');
    final response =
        await Dio().get(ApiConstance.attributeTermsPath(id, page, perPage));
    if (response.statusCode == 200) {
      return List<TermModel>.from((response.data as List).map(
        (e) => TermModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
