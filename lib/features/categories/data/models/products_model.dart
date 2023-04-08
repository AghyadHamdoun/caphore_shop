import 'package:caphore/features/categories/domain/entities/products.dart';

class ProductModel extends Product {
  const ProductModel({required super.id,
    required super.name,
    required super.description,
    required super.shortDescription,
    required super.price,
    required super.regularPrice,
    required super.salePrice,
    required super.categories,
    required super.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      ProductModel(id: json['id'],
          name: json['name'],
          description: json['description'],
          shortDescription: json['shortDescription'],
          price: json['price'],
          regularPrice: json['regularPrice'],
          salePrice: json['salePrice'],
          categories:  List<CategoriesModel>.from(
              json["categories"].map((x) => CategoriesModel.fromJson(x))),
          images: List<ImagesModel>.from(
              json["images"].map((x) => ImagesModel.fromJson(x))));

}




class CategoriesModel extends Categories {
  const CategoriesModel(
      {required super.id, required super.name, required super.slug});
 factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(id: json['id'], name: json['name'], slug: json['slug']);

}

class ImagesModel extends Images {
  ImagesModel(
      {required super.id, required super.dateCreated, required super.dateCreatedGmt, required super.dateModified, required super.dateModifiedGmt, required super.src, required super.name, required super.alt});
  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(id: json['id'], dateCreated: json['date_created'], dateCreatedGmt: json['date_created_gmt'], dateModified: json['date_modified'], dateModifiedGmt: json['date_modified_gmt'], src: json['src'], name: json['name'], alt: json['alt']);

}


