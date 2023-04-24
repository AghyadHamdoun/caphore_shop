import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/usecases/get_all_categories_usecase.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;

  CategoriesBloc(this.getAllCategoriesUseCase)
      : super(const CategoriesState()) {
    //All Category Event
    on<GetAllCategoriesEvent>((event, emit) async {
      final result =
          await getAllCategoriesUseCase(const AllCategoriesParameters());
      result.fold(
          (l) => emit(state.copyWith(
              allCategoriesMessage: l.message,
              allCategoriesState: RequestState.error)),
          (r) => emit(state.copyWith(
              allCategories: r, allCategoriesState: RequestState.loaded)));
    });

    //Product Details Event
    on<GetProductDetailsEvent>((event, emit) async{});

  }
  void getProductDetail(int productId,int categoryId){
    add(GetProductDetailsEvent(productId: productId, categoryId: categoryId));
  }
}
