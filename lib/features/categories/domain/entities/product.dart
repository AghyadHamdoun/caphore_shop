import 'package:equatable/equatable.dart';

class Product extends Equatable{

final int id;
final String name;
final String image;
final String? description;
final String? shortDescription;
final String? price;
final String? regularPrice;
final String? salePrice;

  Product(this.id, this.name, this.image, this.description, this.shortDescription, this.price, this.regularPrice, this.salePrice);



  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
