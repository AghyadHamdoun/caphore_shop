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
  final int perPage;

  const GetGategoryProductsEvent(
      {required this.pageNum, required this.categoryId, required this.perPage});
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

class GetBrandTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetBrandTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetClothingTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetClothingTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetShoesAndBagsTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetShoesAndBagsTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetElectronicEquipmentTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetElectronicEquipmentTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetHouseAndKitchenTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetHouseAndKitchenTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetMakeUpTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetMakeUpTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetWatchesAndAccessoriesTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetWatchesAndAccessoriesTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetPerfumesTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetPerfumesTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetHandMadeTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetHandMadeTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetPetsTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetPetsTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetToysTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetToysTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetFastFoodTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetFastFoodTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetArabFoodTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetArabFoodTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetSweetTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetSweetTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}

class GetCoffeTermsEvent extends CategoriesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetCoffeTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage});
}
