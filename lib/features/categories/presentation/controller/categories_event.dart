import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];

}
class GetAllCategories extends CategoriesEvent {}

class GetProductDetails extends CategoriesEvent {}

class GetGategoryProducts extends CategoriesEvent {}


