import 'package:equatable/equatable.dart';

class AllProducts extends Equatable{
  final List<Product> allProducts;

 const AllProducts({required this.allProducts});
  @override
  // TODO: implement props
  List<Object?> get props => [allProducts];

}

class Product extends Equatable {
  final int id;
  final String name;
  final String image;
  final String description;
  final String shortDescription;
  final String price;
  final String regularPrice;
  final String salePrice;
  final List<Categories> categories;
  final List<Images> images;

 const Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.shortDescription,
      required this.price,
      required this.regularPrice,
      required this.salePrice,
      required this.categories,
      required this.images});

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        description,
        shortDescription,
        price,
        regularPrice,
        salePrice,
        categories,
        images
      ];
}

class Categories extends Equatable {
  final int id;
  final String name;
  final String slug;

 const Categories({required this.id, required this.name, required this.slug});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, slug];
}

class Images extends Equatable {
  final int id;
  final String dateCreated;
  final String dateCreatedGmt;
  final String dateModified;
  final String dateModifiedGmt;
  final String src;
  final String name;
  final String alt;

  Images(
      {required this.id,
      required this.dateCreated,
      required this.dateCreatedGmt,
      required this.dateModified,
      required this.dateModifiedGmt,
      required this.src,
      required this.name,
      required this.alt});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        dateCreated,
        dateCreatedGmt,
        dateModified,
        dateModifiedGmt,
        src,
        name,
        alt
      ];
}
