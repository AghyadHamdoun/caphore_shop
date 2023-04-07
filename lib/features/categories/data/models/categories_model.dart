import 'package:caphore/features/categories/domain/entities/categories.dart';

class CategoryModel extends Category {
  const CategoryModel(
      {required super.id,
      required super.name,
      required super.slug,
      required super.parent,
      required super.description,
      required super.display,
      required super.image,
      required super.menuOrder,
      required super.count,
      required super.lLinks});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      parent: json['parent'],
      description: json['description'],
      display: json['display'],
      image: json['image'],
      menuOrder: json['menu_order'],
      count: json['count'],
      lLinks: json['_links']);
}

class ImageModel extends Image {
  ImageModel(
      {required super.id,
      required super.dateCreated,
      required super.dateCreatedGmt,
      required super.dateModified,
      required super.dateModifiedGmt,
      required super.src,
      required super.name,
      required super.alt});

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'],
      dateCreated: json['date_created'],
      dateCreatedGmt: json['date_created_gmt'],
      dateModified: json['date_modified'],
      dateModifiedGmt: json['date_modified_gmt'],
      src: json['src'],
      name: json['name'],
      alt: json['alt']);
}

class LinksModel extends Links {
  LinksModel({required super.self});

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      LinksModel(self: json['self']);
}

class SelfModel extends Self {
  SelfModel({required super.href});

  factory SelfModel.fromJson(Map<String, dynamic> json) =>
      SelfModel(href: json['href']);
}
