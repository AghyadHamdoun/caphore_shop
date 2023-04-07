import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String slug;
  final int parent;
  final String description;
  final String display;
  final Image image;
  final int menuOrder;
  final int count;
  final Links lLinks;

  const Category(
      {required this.id,
      required this.name,
      required this.slug,
      required this.parent,
      required this.description,
      required this.display,
      required this.image,
      required this.menuOrder,
      required this.count,
      required this.lLinks});

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        parent,
        description,
        display,
        image,
        menuOrder,
        count,
        lLinks
      ];
}

class Image extends Equatable {
  final int id;
  final String dateCreated;
  final String dateCreatedGmt;
  final String dateModified;
  final String dateModifiedGmt;
  final String src;
  final String name;
  final String alt;

  Image(
      {required this.id,
      required this.dateCreated,
      required this.dateCreatedGmt,
      required this.dateModified,
      required this.dateModifiedGmt,
      required this.src,
      required this.name,
      required this.alt});

  @override
  List<Object?> get props => [
        id,
        dateCreated,
        dateCreatedGmt,
        dateModifiedGmt,
        dateModified,
        src,
        name,
        alt
      ];
}

class Links extends Equatable {
  final List<Self> self;

  Links({required this.self});

  @override
  List<Object?> get props => [self];
}

class Self extends Equatable {
  final String href;

  Self({required this.href});

  @override
  List<Object?> get props => [href];
}
