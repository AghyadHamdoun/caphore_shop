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

class GetBrandsProductsEvent extends CategoriesEvent{}

class GetWomenClothingProductsEvent extends CategoriesEvent{}

class GetMenClothingProductsEvent extends CategoriesEvent{}

class GetChildrenClothingProductsEvent extends CategoriesEvent{}

class GetFoodProductsEvent extends CategoriesEvent{}

class GetShoesAndBagsProductsEvent extends CategoriesEvent{}

class GetWatchesAndAccessoriesProductsEvent extends CategoriesEvent{}

class GetMobilesProductsEvent extends CategoriesEvent{}

class GetPerfumesProductsEvent extends CategoriesEvent{}

class GetHouseAndKitchenProductsEvent extends CategoriesEvent{}

class GetElectronicEquipmentProductsEvent extends CategoriesEvent{}

class GetMakeUpProductsEvent extends CategoriesEvent{}

class GetPetsProductsEvent extends CategoriesEvent{}





