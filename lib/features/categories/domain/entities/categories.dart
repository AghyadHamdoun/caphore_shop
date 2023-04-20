import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final String description;
  final Image image;

  const Category(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
      ];
}

class Image extends Equatable {
  final int id;
  final String dateCreated;
  final String src;
  final String name;

 const Image(
      {required this.id,
      required this.dateCreated,
      required this.src,
      required this.name});

  @override
  List<Object?> get props => [
        id,
        dateCreated,
        src,
        name
      ];
}
