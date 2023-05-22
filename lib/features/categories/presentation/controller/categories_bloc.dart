import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_last_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:collection/collection.dart";

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetProductDetailsUseCase getProductDetailsUseCase;
  GetCategoryProductsUseCase getCategoryProductsUseCase;
  GetLastProductsUseCase getLastProductsUseCase;

  CategoriesBloc(this.getAllCategoriesUseCase, this.getProductDetailsUseCase,
      this.getCategoryProductsUseCase, this.getLastProductsUseCase)
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
      final result = await getLastProductsUseCase(
          CategoryProductsParameters(categoryId: 0, page: event.pageNum,perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              lastProductsMessage: l.message,
              lastProductsState: RequestState.error,
              categoryProductsMessage: l.message,
              categoryProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              lastProducts: r,
              lastProductsState: RequestState.loaded,
              categoryProducts: r,
              categoryProductsState: RequestState.loaded)));
    });
    //men clothing event
    on<GetMenClothingProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum, perPage: event.perPage));
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
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
      result.fold(
          (l) => emit(state.copyWith(
              makeUpProductsMessage: l.message,
              makeUpProductsState: RequestState.error)),
          (r) => emit(state.copyWith(
              makeUpProducts: r,
              makeUpProductsState: RequestState.loaded)));
    });

    //pets products event
    on<GetPetsProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(
              categoryId: event.categoryId, page: event.pageNum,perPage: event.perPage));
      result.fold(
              (l) => emit(state.copyWith(
              petsProductsMessage: l.message,
              petsProductsState: RequestState.error)),
              (r) => emit(state.copyWith(
              petsProducts: r,
              petsProductsState: RequestState.loaded)));
    });

  }

  void getProductDetail(int productId, int categoryId) {
    add(GetProductDetailsEvent(productId: productId, categoryId: categoryId));
  }
}
