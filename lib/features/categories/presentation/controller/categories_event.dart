import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];

}
class GetAllCategoriesEvent extends CategoriesEvent {}

class GetProductDetailsEvent extends CategoriesEvent {}

class GetGategoryProductsEvent extends CategoriesEvent {}


