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

  const GetProductDetailsEvent(
      {required this.productId, required this.categoryId});
}

class GetGategoryProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetGategoryProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetLastProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetLastProductsEvent({required this.pageNum, required this.categoryId});
}

class GetBrandsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetBrandsProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetWomenClothingProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetWomenClothingProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetMenClothingProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetMenClothingProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetChildrenClothingProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetChildrenClothingProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetFoodProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetFoodProductsEvent({required this.pageNum, required this.categoryId});
}

class GetShoesAndBagsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetShoesAndBagsProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetWatchesAndAccessoriesProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetWatchesAndAccessoriesProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetMobilesProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetMobilesProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetPerfumesProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetPerfumesProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetHouseAndKitchenProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetHouseAndKitchenProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetElectronicEquipmentProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetElectronicEquipmentProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetMakeUpProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetMakeUpProductsEvent(
      {required this.pageNum, required this.categoryId});
}

class GetPetsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;

  const GetPetsProductsEvent({required this.pageNum, required this.categoryId});
}
