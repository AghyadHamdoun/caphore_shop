import 'package:caphore/features/categories/domain/entities/categories.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id: json['id']??0,
      name: json['name']??'',
      description: json['description']??'',
      image: ImageModel.fromJson(json['image']?? {
        "id": 0,
        "date_created": "",
        "src": "",
        "name": "",
      }));
}

class ImageModel extends Image {
 const ImageModel({required super.id,
    required super.dateCreated,
    required super.src,
    required super.name});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      ImageModel(
          id: json['id'],
          dateCreated: json['date_created'],
          src: json['src'],
          name: json['name']);
}