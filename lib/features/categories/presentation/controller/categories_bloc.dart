import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_gategory_products_usecase.dart';
import 'package:caphore/features/categories/domain/usecases/get_product_details_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:collection/collection.dart";

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetProductDetailsUseCase getProductDetailsUseCase;
  GetCategoryProductsUseCase getCategoryProductsUseCase;

  CategoriesBloc(this.getAllCategoriesUseCase, this.getProductDetailsUseCase,
      this.getCategoryProductsUseCase)
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
            allCategories: r.skipWhile((value) => value.parent!=0 || value.image.src=='').toList(),
            allCategoriesState: RequestState.loaded,
            categoryParents: r.groupListsBy((element) => element.parent)));
      });
    });

    //Product Details Event
    on<GetProductDetailsEvent>((event, emit) async {});

    //last Products Event
    on<GetLastProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
           CategoryProductsParameters(categoryId: event.categoryId, page: event.pageNum));
      result.fold((l) =>
        emit(state.copyWith(
          lastProductsMessage: l.message,
          lastProductsState: RequestState.error
        ))
      , (r) => emit(state.copyWith(
            lastProducts: r,
            lastProductsState: RequestState.loaded
          )));
    }
    );
    //men clothing event
    on<GetMenClothingProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(categoryId: event.categoryId, page: event.pageNum));
      result.fold((l) =>
          emit(state.copyWith(
              menClothingProductsMessage: l.message,
              menClothingProductsState: RequestState.error
          ))
          , (r) => emit(state.copyWith(
              menClothingProducts: r,
              menClothingProductsState: RequestState.loaded
          )));
    }
    );
    //category Products event
    on<GetGategoryProductsEvent>((event, emit) async {
      final result = await getCategoryProductsUseCase(
          CategoryProductsParameters(categoryId: event.categoryId, page: event.pageNum));
      result.fold((l) =>
          emit(state.copyWith(
              categoryProductsMessage: l.message,
              categoryProductsState: RequestState.error
          ))
          , (r) => emit(state.copyWith(
              categoryProducts: r,
              categoryProductsState: RequestState.loaded
          )));
    }
    );
  }

  void getProductDetail(int productId, int categoryId) {
    add(GetProductDetailsEvent(productId: productId, categoryId: categoryId));
  }
}
