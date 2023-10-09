import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object> get props => [];
}

class GetAllCategoriesEvent extends CategoriesEvent {
  final int page;

 const GetAllCategoriesEvent({required this.page});
}

class GetCategoriesByParentEvent extends CategoriesEvent {
  final int parent;

  const GetCategoriesByParentEvent({required this.parent});
}

class GetProductDetailsEvent extends CategoriesEvent {
  final int productId;
  final int categoryId;

  const GetProductDetailsEvent(
      {required this.productId, required this.categoryId});
}

class GetCategoryProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;
  final List<Product> lastProducts;

  const GetCategoryProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage,required this.lastProducts,});
}

class GetLastProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int perPage;

  const GetLastProductsEvent({required this.pageNum, required this.perPage});
}

class GetBrandsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetBrandsProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetWomenClothingProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetWomenClothingProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetMenClothingProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetMenClothingProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetChildrenClothingProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetChildrenClothingProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetFoodProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetFoodProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetShoesAndBagsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetShoesAndBagsProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetWatchesAndAccessoriesProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetWatchesAndAccessoriesProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetMobilesProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetMobilesProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetPerfumesProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetPerfumesProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetHouseAndKitchenProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetHouseAndKitchenProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetElectronicEquipmentProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetElectronicEquipmentProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetMakeUpProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetMakeUpProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetPetsProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetPetsProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}

class GetSearchProductsEvent extends CategoriesEvent {
  final int pageNum;
  final String search;
  final int perPage;

  const GetSearchProductsEvent(
      {required this.pageNum, required this.search, required this.perPage});
}

class CurrentSliderEvent extends CategoriesEvent {
  final int currentSlider;

  const CurrentSliderEvent({required this.currentSlider});
}

class GetOffersProductsEvent extends CategoriesEvent {
  final int pageNum;
  final int categoryId;
  final int perPage;

  const GetOffersProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
}
