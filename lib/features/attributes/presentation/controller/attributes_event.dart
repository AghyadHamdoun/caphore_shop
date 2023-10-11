import 'package:equatable/equatable.dart';

abstract class AttributesEvent extends Equatable {
  const AttributesEvent();

  @override
  List<Object> get props => [];
}

class GetBrandTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetBrandTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
        required this.isRefresh
      });
}

class GetClothingTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetClothingTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetShoesAndBagsTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetShoesAndBagsTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetElectronicEquipmentTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetElectronicEquipmentTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetHouseAndKitchenTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetHouseAndKitchenTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetMakeUpTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetMakeUpTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetWatchesAndAccessoriesTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetWatchesAndAccessoriesTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetPerfumesTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetPerfumesTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetHandMadeTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetHandMadeTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetPetsTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetPetsTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetToysTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetToysTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetFastFoodTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetFastFoodTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetArabFoodTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetArabFoodTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetSweetTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetSweetTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetCoffeeTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;
  final bool isRefresh;

  const GetCoffeeTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      required this.isRefresh});
}

class GetBannersTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;


  const GetBannersTermsEvent(
      {required this.pageNum,
      required this.attributeId,
      required this.perPage,
      });
}

class GetTermProductsEvent extends AttributesEvent {
  final String attribute;
  final int termId;
  final int pageNum;
  final int perPage;


  const GetTermProductsEvent(
      {required this.attribute,
      required this.termId,
      required this.pageNum,
      required this.perPage,
     });
}

class CurrentSliderEvent extends AttributesEvent {
  final int currentSlider;

  const CurrentSliderEvent({required this.currentSlider});
}
