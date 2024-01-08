import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String permalink;
  final String description;
  final dynamic shortDescription;
  final String price;
  final String regularPrice;
  final String salePrice;
  final List<Categories> categories;
  final List<Images> images;
  final List<Meta> meta_data;
  final String? nameAndNumber;
  final String? nameAndNumber2;
  final int total;
  final int? amount;

  const Product({
    required this.id,
    required this.name,
    required this.permalink,
    required this.description,
    required this.shortDescription,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.categories,
    required this.images,
    required this.meta_data,
    required this.nameAndNumber,
    required this.nameAndNumber2,
    required this.amount,
    required this.total,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        permalink,
        description,
        shortDescription,
        price,
        regularPrice,
        salePrice,
        categories,
        images,
        nameAndNumber,
        nameAndNumber2,
        amount,
        total
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
  final String src;
  final String name;

  const Images({
    required this.id,
    required this.src,
    required this.name,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        src,
        name,
      ];
}

class Meta extends Equatable {
  final dynamic value;
  final dynamic key;

  const Meta({
    required this.value,
    required this.key,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        value,
      ];
}
