import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_last_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_terms_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:collection/collection.dart";

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetProductDetailsUseCase getProductDetailsUseCase;
  GetCategoryProductsUseCase getCategoryProductsUseCase;
  GetLastProductsUseCase getLastProductsUseCase;
  GetTermsUseCase getTermsUseCase;

  CategoriesBloc(
      this.getAllCategoriesUseCase,
      this.getProductDetailsUseCase,
      this.getCategoryProductsUseCase,
      this.getLastProductsUseCase,
      this.getTermsUseCase)
      : super(const CategoriesState()) {
    //All Category Event
    on<GetAllCategoriesEvent>((event, emit) async {
      final result =
          await getAllCategoriesUseCase(const AllCategoriesParameters());
      result.fold(
          (l) => emit(state.copyWith(
              allCategoriesMessage: l.message,
              allCategoriesState: RequestState.error)), (r) {
        emit(state.copyWith(
            allCategories: r
                .skipWhile(
                    (value) => value.parent != 0 || value.image.src == '')
                .toList(),
            allCategoriesState: RequestState.loaded,
            categoryParents: r.groupListsBy((element) => element.parent)));
      });
    });

    //Product Details Event
    on<GetProductDetailsEvent>((event, emit) async {});

    //category Products event
    on<GetGategoryProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              categoryProductsMessage: l.message,
              categoryProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              categoryProducts: r,
              categoryProductsState: RequestState.loaded)));
    });

    //last Products Event
    on<GetLastProductsEvent>((event, emit) async {
      final result = await getLastProductsUseCase(CategoryProductsParameters(
          categoryId: 0, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              lastProductsMessage: l.message,
              lastProductsState: RequestState.error,
              categoryProductsMessage: l.message,
              categoryProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              lastProducts:
                  r.skipWhile((value) => value.name == 'AUTO-DRAFT').toList(),
              lastProductsState: RequestState.loaded,
              categoryProducts:
                  r.skipWhile((value) => value.name == 'AUTO-DRAFT').toList(),
              categoryProductsState: RequestState.loaded)));
    });
    //men clothing event
    on<GetMenClothingProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              menClothingProductsMessage: l.message,
              menClothingProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              menClothingProducts: r,
              menClothingProductsState: RequestState.loaded)));
    });
    // women clothing event
    on<GetWomenClothingProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              womenClothingProductsMessage: l.message,
              womenClothingProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              womenClothingProducts: r,
              womenClothingProductsState: RequestState.loaded)));
    });

    //children clothing event

    on<GetChildrenClothingProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              childrenClothingProductsMessage: l.message,
              childrenClothingProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              childrenClothingProducts: r,
              childrenClothingProductsState: RequestState.loaded)));
    });

    //food products event
    on<GetFoodProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              foodProductsMessage: l.message,
              foodProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              foodProducts: r, foodProductsState: RequestState.loaded)));
    });

    //shoes and bags products event
    on<GetShoesAndBagsProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              shoesAndBagsProductsMessage: l.message,
              shoesAndBagsProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              shoesAndBagsProducts: r,
              shoesAndBagsProductsState: RequestState.loaded)));
    });

    //watches and accessories products event
    on<GetWatchesAndAccessoriesProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              watchesAndAccessoriesProductsMessage: l.message,
              watchesAndAccessoriesProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              watchesAndAccessoriesProducts: r,
              watchesAndAccessoriesProductsState: RequestState.loaded)));
    });

    //mobiles products event
    on<GetMobilesProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              mobilesProductsMessage: l.message,
              mobilesProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              mobilesProducts: r, mobilesProductsState: RequestState.loaded)));
    });

    //perfumes products event
    on<GetPerfumesProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              mobilesProductsMessage: l.message,
              mobilesProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              mobilesProducts: r, mobilesProductsState: RequestState.loaded)));
    });

    //house and kitchen products event
    on<GetHouseAndKitchenProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              houseAndKitchenProductsMessage: l.message,
              houseAndKitchenProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              houseAndKitchenProducts: r,
              houseAndKitchenProductsState: RequestState.loaded)));
    });

    //electronicEquipment products event
    on<GetElectronicEquipmentProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              electronicEquipmentProductsMessage: l.message,
              electronicEquipmentProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              electronicEquipmentProducts: r,
              electronicEquipmentProductsState: RequestState.loaded)));
    });

    //makeup products event
    on<GetMakeUpProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              makeUpProductsMessage: l.message,
              makeUpProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              makeUpProducts: r, makeUpProductsState: RequestState.loaded)));
    });

    //pets products event
    on<GetPetsProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId,
              page: event.pageNum,
              perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              petsProductsMessage: l.message,
              petsProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              petsProducts: r, petsProductsState: RequestState.loaded)));
    });

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
    on<GetCoffeTermsEvent>((event, emit) async {
      final result = await getTermsUseCase(TermsParameters(
          id: event.attributeId, page: event.pageNum, perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              //state
              coffeTermsMessage: l.message,
              coffeTermsState: RequestState.error)),
          (r) => emit(state.copyWith(
              //state
              coffeTerms: r,
              coffeTermsState: RequestState.loaded)));
    });
  }

  void getProductDetail(int productId, int categoryId) {
    add(GetProductDetailsEvent(productId: productId, categoryId: categoryId));
  }
}
