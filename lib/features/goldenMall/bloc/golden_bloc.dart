import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'golden_event.dart';
import 'golden_state.dart';

class GoldenBloc extends Bloc<GoldenEvent, GoldenState> {
  GoldenBloc() : super(const GoldenState()) {
    on<AddProductToBasket>((event, emit) async {
      List<Product> myList = [];
      var product = event.productModel;
      product = Product(
        id: event.productModel.id,
        name: event.productModel.name,
        permalink: event.productModel.permalink,
        description: event.productModel.description,
        shortDescription: event.productModel.shortDescription,
        price: event.productModel.price,
        regularPrice: event.productModel.regularPrice,
        salePrice: event.productModel.salePrice,
        categories: event.productModel.categories,
        images: event.productModel.images,
        meta_data: event.productModel.meta_data,
        nameAndNumber: event.productModel.nameAndNumber,
        nameAndNumber2: event.productModel.nameAndNumber2,
        amount: 1,
        total: int.parse(event.productModel.price),
      );
      myList.add(product);
      myList += state.basketProducts;
      emit(state.copyWith(basketProducts: myList));
    });
    on<DeleteProductFromBasket>((event, emit) async {
      List<Product> myList = [];
      myList += state.basketProducts;
   myList.removeAt(event.index);
      emit(state.copyWith(basketProducts: myList));
    });
    on<IncreaseOne>((event, emit) async {
      List<Product> myList = [];
      myList += state.basketProducts;
      var product = Product(
        id: myList[event.index].id,
        name: myList[event.index].name,
        permalink: myList[event.index].permalink,
        description: myList[event.index].description,
        shortDescription: myList[event.index].shortDescription,
        price: myList[event.index].price,
        regularPrice: myList[event.index].regularPrice,
        salePrice: myList[event.index].salePrice,
        categories: myList[event.index].categories,
        images: myList[event.index].images,
        meta_data: myList[event.index].meta_data,
        nameAndNumber: myList[event.index].nameAndNumber,
        nameAndNumber2: myList[event.index].nameAndNumber2,
        amount: myList[event.index].amount! + 1,
        total: myList[event.index].total + int.parse(myList[event.index].price),
      );
      myList[event.index] = product;
      emit(state.copyWith(basketProducts: myList));
    });
    on<MinusOne>((event, emit) async {
      List<Product> myList = [];
      myList += state.basketProducts;
      var product = Product(
        id: myList[event.index].id,
        name: myList[event.index].name,
        permalink: myList[event.index].permalink,
        description: myList[event.index].description,
        shortDescription: myList[event.index].shortDescription,
        price: myList[event.index].price,
        regularPrice: myList[event.index].regularPrice,
        salePrice: myList[event.index].salePrice,
        categories: myList[event.index].categories,
        images: myList[event.index].images,
        meta_data: myList[event.index].meta_data,
        nameAndNumber: myList[event.index].nameAndNumber,
        nameAndNumber2: myList[event.index].nameAndNumber2,
        amount: myList[event.index].amount != 1
            ? myList[event.index].amount! - 1
            : 1,
        total: myList[event.index].amount != 1
            ? myList[event.index].total - int.parse(myList[event.index].price)
            : int.parse(myList[event.index].price),
      );
      myList[event.index] = product;
      emit(state.copyWith(basketProducts: myList));
    });
    on<MakeBasketEmpty>((event, emit) async {
      List<Product> myList = [];
      emit(state.copyWith(basketProducts: myList));
    });
  }
}
