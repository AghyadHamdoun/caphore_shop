import 'package:caphore/core/utils/enums.dart';
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
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              brandsTermsMessage: l.message,
              brandsTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              brandsTerms: r,
              brandsTermsState: RequestState.loaded)));
    });
    //end
    //
    on<GetClothingTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              clothingTermsMessage: l.message,
              clothingTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              clothingTerms: r,
              clothingTermsState: RequestState.loaded)));
    });
    on<GetShoesAndBagsTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              shoesandbagsTermsMessage: l.message,
              shoesandbagsTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              shoesandbagsTerms: r,
              shoesandbagsTermsState: RequestState.loaded)));
    });
    //
    on<GetElectronicEquipmentTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              electronicequipmentTermsMessage: l.message,
              electronicequipmentTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              electronicequipmentTerms: r,
              electronicequipmentTermsState: RequestState.loaded)));
    });
    //
    on<GetHouseAndKitchenTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              houseandkitchenTermsMessage: l.message,
              houseandkitchenTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              houseandkitchenTerms: r,
              houseandkitchenTermsState: RequestState.loaded)));
    });
    on<GetMakeUpTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              makeupTermsMessage: l.message,
              makeupTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              makeupTerms: r,
              makeupTermsState: RequestState.loaded)));
    });
    on<GetWatchesAndAccessoriesTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              watchesandaccessoriesTermsMessage: l.message,
              watchesandaccessoriesTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              watchesandaccessoriesTerms: r,
              watchesandaccessoriesTermsState: RequestState.loaded)));
    });
    on<GetPerfumesTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              perfumesTermsMessage: l.message,
              perfumesTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              perfumesTerms: r,
              perfumesTermsState: RequestState.loaded)));
    });
    on<GetHandMadeTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              handmadeTermsMessage: l.message,
              handmadeTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              handmadeTerms: r,
              handmadeTermsState: RequestState.loaded)));
    });
    on<GetPetsTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              petsTermsMessage: l.message,
              petsTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              petsTerms: r,
              petsTermsState: RequestState.loaded)));
    });
    on<GetToysTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              toysTermsMessage: l.message,
              toysTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              toysTerms: r,
              toysTermsState: RequestState.loaded)));
    });
    on<GetFastFoodTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              fastfoodTermsMessage: l.message,
              fastfoodTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              fastfoodTerms: r,
              fastfoodTermsState: RequestState.loaded)));
    });
    on<GetArabFoodTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              arabfoodTermsMessage: l.message,
              arabfoodTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              arabfoodTerms: r,
              arabfoodTermsState: RequestState.loaded)));
    });
    on<GetSweetTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              sweetTermsMessage: l.message,
              sweetTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              sweetTerms: r,
              sweetTermsState: RequestState.loaded)));
    });
    on<GetCoffeeTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              coffeeTermsMessage: l.message,
              coffeeTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              coffeeTerms: r,
              coffeeTermsState: RequestState.loaded)));
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

    on<CurrentSliderEvent>((event, emit)  {
     emit(state.copyWith(
       currentSlider: event.currentSlider
     ));
    });


  }
}
