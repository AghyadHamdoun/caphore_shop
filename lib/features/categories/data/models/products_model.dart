import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/presentation/screeens/sub_categories.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.id,
      required super.name,
      required super.permalink,
      required super.description,
      required super.shortDescription,
      required super.price,
      required super.regularPrice,
      required super.salePrice,
      required super.categories,
      required super.images,
      required super.nameAndNumber,
      required super.nameAndNumber2,
      required super.meta_data,
      required super.amount,
      required super.total
      });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      permalink: json['permalink'] ?? '',
      description: json['description'] ?? '',
      shortDescription: json['short_description'] ?? '',
      price: json['price'] ?? '',
      regularPrice: json['regular_price'] ?? '',
      salePrice: json['salePrice'] ?? '',
      categories: List<CategoriesModel>.from(
          json["categories"].map((x) => CategoriesModel.fromJson(x))),
      images: List<ImagesModel>.from(
          json["images"].map((x) => ImagesModel.fromJson(x))),
      nameAndNumber: (json['meta_data'] as List).length >= 7
          ? json['meta_data'][6]['value']
          : '',
      nameAndNumber2: (json['meta_data'] as List).length >= 8
          ? json['meta_data'][7]['value']
          : '',
      amount: 0,
      total: 0,
      meta_data: List<MetaModel>.from(
          json["meta_data"].map((x) => MetaModel.fromJson(x))));
}

class CategoriesModel extends Categories {
  const CategoriesModel(
      {required super.id, required super.name, required super.slug});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(id: json['id'], name: json['name'], slug: json['slug']);
}

class ImagesModel extends Images {
  ImagesModel({
    required super.id,
    required super.src,
    required super.name,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) =>
      ImagesModel(id: json['id'], src: json['src'], name: json['name']);
}

class MetaModel extends Meta {
  MetaModel({
    required super.value,
    required super.key,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      MetaModel(value: json['value'], key: json['key']);
}
