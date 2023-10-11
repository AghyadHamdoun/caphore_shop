import 'dart:convert';

import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/core/utils/prefrences.dart';
import 'package:caphore/features/attributes/data/models/terms_model.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/domain/usecases/get_terms_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_term_products_usecase.dart';

class AttributesBloc extends Bloc<AttributesEvent, AttributesState> {
  GetTermsUseCase getTermsUseCase;
  GetTermProductsUseCase getTermsProductsUseCase;

  AttributesBloc(this.getTermsUseCase, this.getTermsProductsUseCase)
      : super(const AttributesState()) {
    //------ Attribute Terms------
    //begin
    //event
    on<GetBrandTermsEvent>((event, emit) async {
      emit(state.copyWith(brandsTermsState: RequestState.loading));

      String? terms = Preferences.getBrands();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            brandsTerms: myTerms,
            brandsTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                brandsTermsMessage: l.message,
                brandsTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveBrands(terms);
          emit(state.copyWith(
            //state
              brandsTerms: r,
              brandsTermsState: RequestState.loaded));
        });
      }
    });
    //end
    //
    on<GetClothingTermsEvent>((event, emit) async {
      emit(state.copyWith(clothingTermsState: RequestState.loading));

      String? terms = Preferences.getClothing();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            clothingTerms: myTerms,
            clothingTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                clothingTermsMessage: l.message,
                clothingTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveClothing(terms);
          emit(state.copyWith(
              //state
              clothingTerms: r,
              clothingTermsState: RequestState.loaded));
        });
      }
    });
    on<GetShoesAndBagsTermsEvent>((event, emit) async {
      String? terms = Preferences.getShoesAndBags();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            shoesandbagsTerms: myTerms,
            shoesandbagsTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                shoesandbagsTermsMessage: l.message,
                shoesandbagsTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveShoesAndBags(terms);
          emit(state.copyWith(
              //state
              shoesandbagsTerms: r,
              shoesandbagsTermsState: RequestState.loaded));
        });
      }
    });
    //
    on<GetElectronicEquipmentTermsEvent>((event, emit) async {
      String? terms = Preferences.getElectronicEquipment();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            electronicequipmentTerms: myTerms,
            electronicequipmentTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                electronicequipmentTermsMessage: l.message,
                electronicequipmentTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveElectronicEquipment(terms);
          emit(state.copyWith(
              //state
              electronicequipmentTerms: r,
              electronicequipmentTermsState: RequestState.loaded));
        });
      }
    });
    //
    on<GetHouseAndKitchenTermsEvent>((event, emit) async {
      String? terms = Preferences.getHouseAndKitchen();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            houseandkitchenTerms: myTerms,
            houseandkitchenTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                houseandkitchenTermsMessage: l.message,
                houseandkitchenTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveHouseAndKitchen(terms);
          emit(state.copyWith(
              //state
              houseandkitchenTerms: r,
              houseandkitchenTermsState: RequestState.loaded));
        });
      }
    });
    on<GetMakeUpTermsEvent>((event, emit) async {
      String? terms = Preferences.getMakeUp();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            makeupTerms: myTerms,
            makeupTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                makeupTermsMessage: l.message,
                makeupTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveMakeUp(terms);
          emit(state.copyWith(
              //state
              makeupTerms: r,
              makeupTermsState: RequestState.loaded));
        });
      }
    });
    on<GetWatchesAndAccessoriesTermsEvent>((event, emit) async {
      String? terms = Preferences.getWatchesAndAccessories();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            watchesandaccessoriesTerms: myTerms,
            watchesandaccessoriesTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                watchesandaccessoriesTermsMessage: l.message,
                watchesandaccessoriesTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveWatchesAndAccessories(terms);
          emit(state.copyWith(
              //state
              watchesandaccessoriesTerms: r,
              watchesandaccessoriesTermsState: RequestState.loaded));
        });
      }
    });
    on<GetPerfumesTermsEvent>((event, emit) async {
      String? terms = Preferences.getPerfumes();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
          (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
            //state
            perfumesTerms: myTerms,
            perfumesTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
            (l) => emit(state.copyWith(
                //state
                perfumesTermsMessage: l.message,
                perfumesTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.savePerfumes(terms);
          emit(state.copyWith(
              //state
              perfumesTerms: r,
              perfumesTermsState: RequestState.loaded));
        });
      }
    });
    on<GetHandMadeTermsEvent>((event, emit) async {
      String? terms = Preferences.getHandMade();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            handmadeTerms: myTerms,
            handmadeTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                handmadeTermsMessage: l.message,
                handmadeTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveHandMade(terms);
          emit(state.copyWith(
            //state
              handmadeTerms: r,
              handmadeTermsState: RequestState.loaded));
        });
      }
    });
    on<GetPetsTermsEvent>((event, emit) async {
      String? terms = Preferences.getPets();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            petsTerms: myTerms,
            petsTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                petsTermsMessage: l.message,
                petsTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.savePets(terms);
          emit(state.copyWith(
            //state
              petsTerms: r,
              petsTermsState: RequestState.loaded));
        });
      }
    });
    on<GetToysTermsEvent>((event, emit) async {
      String? terms = Preferences.getToys();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            toysTerms: myTerms,
            toysTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                toysTermsMessage: l.message,
                toysTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveToys(terms);
          emit(state.copyWith(
            //state
              toysTerms: r,
              toysTermsState: RequestState.loaded));
        });
      }
    });
    on<GetFastFoodTermsEvent>((event, emit) async {
      emit(state.copyWith(
        fastfoodTermsState: RequestState.loading
      ));
      String? terms = Preferences.getFastFood();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            fastfoodTerms: myTerms,
            fastfoodTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                fastfoodTermsMessage: l.message,
                fastfoodTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveFastFood(terms);
          emit(state.copyWith(
            //state
              fastfoodTerms: r,
              fastfoodTermsState: RequestState.loaded));
        });
      }
    });
    on<GetArabFoodTermsEvent>((event, emit) async {
      String? terms = Preferences.getArabFood();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            arabfoodTerms: myTerms,
            arabfoodTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                arabfoodTermsMessage: l.message,
                arabfoodTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveArabFood(terms);
          emit(state.copyWith(
            //state
              arabfoodTerms: r,
              arabfoodTermsState: RequestState.loaded));
        });
      }
    });
    on<GetSweetTermsEvent>((event, emit) async {
      String? terms = Preferences.getSweet();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            sweetTerms: myTerms,
            sweetTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                    sweetTermsMessage: l.message,
                    sweetTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveSweet(terms);
          emit(state.copyWith(
            //state
              sweetTerms: r,
              sweetTermsState: RequestState.loaded));
        });
      }
    });
    on<GetCoffeeTermsEvent>((event, emit) async {
      String? terms = Preferences.getCoffee();
      if (terms != '' && terms != null && event.isRefresh == false) {
        var myTerms = await jsonDecode(terms);
        myTerms = List<TermModel>.from((myTerms).map(
              (e) => TermModel.fromJson(e),
        ));
        emit(state.copyWith(
          //state
            coffeeTerms: myTerms,
            coffeeTermsState: RequestState.loaded));
      } else {
        final result = await getTermsUseCase(TermsParameters(
            id: event.attributeId,
            page: event.pageNum,
            perPage: event.perPage));
        result.fold(
                (l) => emit(state.copyWith(
              //state
                coffeeTermsMessage: l.message,
                coffeeTermsState: RequestState.error)), (r) {
          String terms = jsonEncode(r);
          Preferences.saveCoffee(terms);
          emit(state.copyWith(
            //state
              coffeeTerms: r,
              coffeeTermsState: RequestState.loaded));
        });
      }
    });

    on<GetBannersTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              bannersTermsMessage: l.message,
              bannersTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              bannersTerms: r,
              bannersTermsState: RequestState.loaded)));
    });

    //term products event
    on<GetTermProductsEvent>((event, emit) async {
      final result = await getTermsProductsUseCase(TermProductsParameters(
          page: event.pageNum,
          perPage: event.perPage,
          attribute: event.attribute,
          termId: event.termId));
      result.fold(
          (l) => emit(state.copyWith(
              termProductsMessage: l.message,
              termProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              termProducts: r, termProductsState: RequestState.loaded)));
    });

    on<CurrentSliderEvent>((event, emit) {
      emit(state.copyWith(currentSlider: event.currentSlider));
    });
  }

  void addAllStores({required bool isRefresh}) {
    add(GetClothingTermsEvent(
        pageNum: 1, attributeId: 11, perPage: 100, isRefresh: isRefresh));
    add(GetMakeUpTermsEvent(
        pageNum: 1, attributeId: 15, perPage: 100, isRefresh: isRefresh));
    add(GetShoesAndBagsTermsEvent(
        pageNum: 1, attributeId: 13, perPage: 100, isRefresh: isRefresh));
    add(GetElectronicEquipmentTermsEvent(
        pageNum: 1, attributeId: 12, perPage: 100, isRefresh: isRefresh));
    add(GetHouseAndKitchenTermsEvent(
        pageNum: 1, attributeId: 14, perPage: 100, isRefresh: isRefresh));
    add(GetWatchesAndAccessoriesTermsEvent(
        pageNum: 1, attributeId: 16, perPage: 100, isRefresh: isRefresh));
    add(GetPerfumesTermsEvent(
        pageNum: 1, attributeId: 17, perPage: 100, isRefresh: isRefresh));
    add(GetHandMadeTermsEvent(
        pageNum: 1, attributeId: 18, perPage: 100, isRefresh: isRefresh));
    add(GetPetsTermsEvent(
        pageNum: 1, attributeId: 19, perPage: 100, isRefresh: isRefresh));
    add(GetToysTermsEvent(
        pageNum: 1, attributeId: 20, perPage: 100, isRefresh: isRefresh));
  }

  void addAllRestaurants({required bool isRefresh}) {
    add(GetFastFoodTermsEvent(
        pageNum: 1, attributeId: 21, perPage: 100, isRefresh: isRefresh));
    add(GetArabFoodTermsEvent(
        pageNum: 1, attributeId: 22, perPage: 100, isRefresh: isRefresh));
    add(GetSweetTermsEvent(
        pageNum: 1, attributeId: 23, perPage: 100, isRefresh: isRefresh));
    add(GetCoffeeTermsEvent(
        pageNum: 1, attributeId: 24, perPage: 100, isRefresh: isRefresh));
  }
}
