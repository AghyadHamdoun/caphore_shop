import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];

}
class GetAllCategoriesEvent extends CategoriesEvent {}

class GetProductDetailsEvent extends CategoriesEvent {
  final int productId;
  final int categoryId;
 const GetProductDetailsEvent({required this.productId,required this.categoryId});
}

class GetGategoryProductsEvent extends CategoriesEvent {
}

class GetLastProductsEvent extends CategoriesEvent{}



