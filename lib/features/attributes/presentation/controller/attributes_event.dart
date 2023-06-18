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

  const GetBrandTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetClothingTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetClothingTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetShoesAndBagsTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetShoesAndBagsTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetElectronicEquipmentTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetElectronicEquipmentTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetHouseAndKitchenTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetHouseAndKitchenTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetMakeUpTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetMakeUpTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetWatchesAndAccessoriesTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetWatchesAndAccessoriesTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetPerfumesTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetPerfumesTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetHandMadeTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetHandMadeTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetPetsTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetPetsTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetToysTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetToysTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetFastFoodTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetFastFoodTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetArabFoodTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetArabFoodTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetSweetTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetSweetTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetCoffeeTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetCoffeeTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}

class GetBannersTermsEvent extends AttributesEvent {
  final int pageNum;
  final int attributeId;
  final int perPage;

  const GetBannersTermsEvent(
      {required this.pageNum,
        required this.attributeId,
        required this.perPage});
}
