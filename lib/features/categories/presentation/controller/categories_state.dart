import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/domain/entities/terms.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  // 1
  final Map<Object, List<Category>> categoryParents;
  final List<Category> allCategories;
  final RequestState allCategoriesState;
  final String allCategoriesMessage;
  final Product product;
  final RequestState productState;
  final String productMessage;
  final List<Product> lastProducts;
  final RequestState lastProductsState;
  final String lastProductsMessage;

  //
  final List<Product> brandsProducts;
  final RequestState brandsProductsState;
  final String brandsProductsMessage;

  //
  final List<Product> womenClothingProducts;
  final RequestState womenClothingProductsState;
  final String womenClothingProductsMessage;

  //
  final List<Product> menClothingProducts;
  final RequestState menClothingProductsState;
  final String menClothingProductsMessage;
  //
  final List<Product> childrenClothingProducts;
  final RequestState childrenClothingProductsState;
  final String childrenClothingProductsMessage;
  //
  final List<Product> foodProducts;
  final RequestState foodProductsState;
  final String foodProductsMessage;
  //
  final List<Product> shoesAndBagsProducts;
  final RequestState shoesAndBagsProductsState;
  final String shoesAndBagsProductsMessage;
  //
  final List<Product> watchesAndAccessoriesProducts;
  final RequestState watchesAndAccessoriesProductsState;
  final String watchesAndAccessoriesProductsMessage;
  //
  final List<Product> mobilesProducts;
  final RequestState mobilesProductsState;
  final String mobilesProductsMessage;
  //
  final List<Product> perfumesProducts;
  final RequestState perfumesProductsState;
  final String perfumesProductsMessage;
  //
  final List<Product> houseAndKitchenProducts;
  final RequestState houseAndKitchenProductsState;
  final String houseAndKitchenProductsMessage;
  //
  final List<Product> electronicEquipmentProducts;
  final RequestState electronicEquipmentProductsState;
  final String electronicEquipmentProductsMessage;
  //
  final List<Product> makeUpProducts;
  final RequestState makeUpProductsState;
  final String makeUpProductsMessage;
  //
  final List<Product> petsProducts;
  final RequestState petsProductsState;
  final String petsProductsMessage;
  //
  final List<Product> categoryProducts;
  final RequestState categoryProductsState;
  final String categoryProductsMessage;

  //attribute terms
  final List<Term> brandsTerms;
  final RequestState brandsTermsState;
  final String brandsTermsMessage;


  // 2
  const CategoriesState({
    this.categoryParents = const {},
    this.allCategories = const [],
    this.allCategoriesState = RequestState.loading,
    this.allCategoriesMessage = '',
    this.product = const Product(
        id: 0,
        name: '',
        salePrice: '',
        description: '',
        shortDescription: '',
        price: '',
        regularPrice: '',
        categories: [],
        images: []),
    this.productState = RequestState.loading,
    this.productMessage = '',
    this.lastProducts = const [],
    this.lastProductsState = RequestState.loading,
    this.lastProductsMessage = '',
    //
    this.brandsProducts = const [],
    this.brandsProductsState = RequestState.loading,
    this.brandsProductsMessage = '',
    //
    this.womenClothingProducts = const [],
    this.womenClothingProductsState = RequestState.loading,
    this.womenClothingProductsMessage = '',
    //
    this.menClothingProducts = const [],
    this.menClothingProductsState = RequestState.loading,
    this.menClothingProductsMessage = '',
    //
    this.childrenClothingProducts = const [],
    this.childrenClothingProductsState = RequestState.loading,
    this.childrenClothingProductsMessage = '',
    //
    this.foodProducts = const [],
    this.foodProductsState = RequestState.loading,
    this.foodProductsMessage = '',
    //
    this.shoesAndBagsProducts = const [],
    this.shoesAndBagsProductsState = RequestState.loading,
    this.shoesAndBagsProductsMessage = '',
    //
    this.watchesAndAccessoriesProducts = const [],
    this.watchesAndAccessoriesProductsState = RequestState.loading,
    this.watchesAndAccessoriesProductsMessage = '',
    //
    this.mobilesProducts = const [],
    this.mobilesProductsState = RequestState.loading,
    this.mobilesProductsMessage = '',
   //
    this.perfumesProducts = const [],
    this.perfumesProductsState = RequestState.loading,
    this.perfumesProductsMessage = '',
    //
    this.houseAndKitchenProducts = const [],
    this.houseAndKitchenProductsState = RequestState.loading,
    this.houseAndKitchenProductsMessage = '',
    //
    this.electronicEquipmentProducts = const [],
    this.electronicEquipmentProductsState = RequestState.loading,
    this.electronicEquipmentProductsMessage = '',
    //
    this.makeUpProducts = const [],
    this.makeUpProductsState = RequestState.loading,
    this.makeUpProductsMessage = '',
    //
    this.petsProducts = const [],
    this.petsProductsState = RequestState.loading,
    this.petsProductsMessage = '',
    //
    this.categoryProducts = const [],
    this.categoryProductsState = RequestState.loading,
    this.categoryProductsMessage = '',
    //

    //attribute terms

    this.brandsTerms = const [],
    this.brandsTermsState = RequestState.loading,
    this.brandsTermsMessage = ''
  });

  CategoriesState copyWith({
    //3
    final Map<Object, List<Category>>? categoryParents,
    final List<Category>? allCategories,
    final RequestState? allCategoriesState,
    final String? allCategoriesMessage,
    final Product? product,
    final RequestState? productState,
    final String? productMessage,
    final List<Product>? lastProducts,
    final RequestState? lastProductsState,
    final String? lastProductsMessage,
    //
    final List<Product>? brandsProducts,
    final RequestState? brandsProductsState,
    final String? brandsProductsMessage,
    //
    final List<Product>? womenClothingProducts,
    final RequestState? womenClothingProductsState,
    final String? womenClothingProductsMessage,
    //
    final List<Product>? menClothingProducts,
    final RequestState? menClothingProductsState,
    final String? menClothingProductsMessage,
    //
    final List<Product>? childrenClothingProducts,
    final RequestState? childrenClothingProductsState,
    final String? childrenClothingProductsMessage,
    //
    final List<Product>? foodProducts,
    final RequestState? foodProductsState,
    final String? foodProductsMessage,
    //
    final List<Product>? shoesAndBagsProducts,
    final RequestState? shoesAndBagsProductsState,
    final String? shoesAndBagsProductsMessage,
    //
    final List<Product>? watchesAndAccessoriesProducts,
    final RequestState? watchesAndAccessoriesProductsState,
    final String? watchesAndAccessoriesProductsMessage,
    //
    final List<Product>? mobilesProducts,
    final RequestState? mobilesProductsState,
    final String? mobilesProductsMessage,
    //
    final List<Product>? perfumesProducts,
    final RequestState? perfumesProductsState,
    final String? perfumesProductsMessage,
    //
    final List<Product>?houseAndKitchenProducts,
    final RequestState? houseAndKitchenProductsState,
    final String? houseAndKitchenProductsMessage,
    //
    final List<Product>?electronicEquipmentProducts,
    final RequestState? electronicEquipmentProductsState,
    final String? electronicEquipmentProductsMessage,
    //
    final List<Product>?makeUpProducts,
    final RequestState? makeUpProductsState,
    final String? makeUpProductsMessage,
    //
    final List<Product>?petsProducts,
    final RequestState? petsProductsState,
    final String? petsProductsMessage,
    //
    final List<Product>?categoryProducts,
    final RequestState? categoryProductsState,
    final String? categoryProductsMessage,

    // attribute terms

    final List<Term>?brandsTerms,
    final RequestState? brandsTermsState,
    final String? brandsTermsMessage,



  }) {
    return CategoriesState(
      // 4
      categoryParents: categoryParents ?? this.categoryParents,
      allCategories: allCategories ?? this.allCategories,
      allCategoriesState: allCategoriesState ?? this.allCategoriesState,
      allCategoriesMessage:
      allCategoriesMessage ?? this.allCategoriesMessage,
      product: product ?? this.product,
      productState: productState ?? this.productState,
      productMessage: productMessage ?? this.productMessage,
      lastProducts: lastProducts ?? this.lastProducts,
      lastProductsState: lastProductsState ?? this.lastProductsState,
      lastProductsMessage: lastProductsMessage ?? this.lastProductsMessage,
      //
      brandsProducts: brandsProducts ?? this.brandsProducts,
      brandsProductsState: brandsProductsState ?? this.brandsProductsState,
      brandsProductsMessage: brandsProductsMessage ??
          this.brandsProductsMessage,
      //
      womenClothingProducts: womenClothingProducts ??
          this.womenClothingProducts,
      womenClothingProductsState: womenClothingProductsState ??
          this.womenClothingProductsState,
      womenClothingProductsMessage: womenClothingProductsMessage ??
          this.womenClothingProductsMessage,
      //
      menClothingProducts: menClothingProducts ?? this.menClothingProducts,
      menClothingProductsState: menClothingProductsState ??
          this.menClothingProductsState,
      menClothingProductsMessage: menClothingProductsMessage ??
          this.menClothingProductsMessage,
      //
      childrenClothingProducts: childrenClothingProducts ?? this.childrenClothingProducts,
      childrenClothingProductsState: childrenClothingProductsState ??
          this.childrenClothingProductsState,
      childrenClothingProductsMessage: childrenClothingProductsMessage ??
          this.childrenClothingProductsMessage,
      //
      foodProducts: childrenClothingProducts ?? this.foodProducts,
      foodProductsState: foodProductsState ??
          this.foodProductsState,
      foodProductsMessage: foodProductsMessage ??
          this.foodProductsMessage,
      //
      shoesAndBagsProducts: shoesAndBagsProducts ?? this.shoesAndBagsProducts,
      shoesAndBagsProductsState: shoesAndBagsProductsState ??
          this.shoesAndBagsProductsState,
      shoesAndBagsProductsMessage: shoesAndBagsProductsMessage ??
          this.shoesAndBagsProductsMessage,
      //
      watchesAndAccessoriesProducts: watchesAndAccessoriesProducts ?? this.watchesAndAccessoriesProducts,
      watchesAndAccessoriesProductsState: watchesAndAccessoriesProductsState ??
          this.watchesAndAccessoriesProductsState,
      watchesAndAccessoriesProductsMessage: watchesAndAccessoriesProductsMessage ??
          this.watchesAndAccessoriesProductsMessage,
      //
      mobilesProducts: mobilesProducts ?? this.mobilesProducts,
      mobilesProductsState: mobilesProductsState ??
          this.mobilesProductsState,
      mobilesProductsMessage: mobilesProductsMessage ??
          this.mobilesProductsMessage,
      //
      perfumesProducts: perfumesProducts ?? this.perfumesProducts,
      perfumesProductsState: perfumesProductsState ??
          this.perfumesProductsState,
      perfumesProductsMessage: perfumesProductsMessage ??
          this.perfumesProductsMessage,
      //
      houseAndKitchenProducts: houseAndKitchenProducts ?? this.houseAndKitchenProducts,
      houseAndKitchenProductsState: houseAndKitchenProductsState ??
          this.houseAndKitchenProductsState,
      houseAndKitchenProductsMessage: houseAndKitchenProductsMessage ??
          this.houseAndKitchenProductsMessage,
      //
      electronicEquipmentProducts: electronicEquipmentProducts ?? this.electronicEquipmentProducts,
      electronicEquipmentProductsState: electronicEquipmentProductsState ??
          this.electronicEquipmentProductsState,
      electronicEquipmentProductsMessage: electronicEquipmentProductsMessage ??
          this.electronicEquipmentProductsMessage,
      //
      makeUpProducts: makeUpProducts ?? this.makeUpProducts,
      makeUpProductsState: makeUpProductsState ??
          this.makeUpProductsState,
      makeUpProductsMessage: makeUpProductsMessage ??
          this.makeUpProductsMessage,
      //
      petsProducts: petsProducts ?? this.petsProducts,
      petsProductsState: petsProductsState ??
          this.petsProductsState,
      petsProductsMessage:petsProductsMessage ??
          this.petsProductsMessage,
      //
      categoryProducts: categoryProducts ?? this.categoryProducts,
      categoryProductsState: categoryProductsState ??
          this.categoryProductsState,
      categoryProductsMessage:categoryProductsMessage ??
          this.categoryProductsMessage,

      brandsTerms: brandsTerms??this.brandsTerms,
      brandsTermsState: brandsTermsState??this.brandsTermsState,
      brandsTermsMessage: brandsTermsMessage??this.brandsTermsMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      //5
  [
    allCategories,
    allCategoriesMessage,
    allCategoriesState
    ,
    product,
    productMessage,
    productState,
    lastProductsState,
    lastProductsMessage,
    lastProducts,
    //
    brandsProductsState,
    brandsProductsMessage,
    brandsProducts,
    //
    womenClothingProductsState,
    womenClothingProductsMessage,
    womenClothingProducts,
    //
    menClothingProductsState,
    menClothingProductsMessage,
    menClothingProducts,
    //
    childrenClothingProductsState,
    childrenClothingProductsMessage,
    childrenClothingProducts,
    //
    foodProductsState,
    foodProductsMessage,
    foodProducts,
    //
    shoesAndBagsProductsState,
    shoesAndBagsProductsMessage,
    shoesAndBagsProducts,
    //
    watchesAndAccessoriesProductsState,
    watchesAndAccessoriesProductsMessage,
    watchesAndAccessoriesProducts,
   //
    mobilesProductsState,
    mobilesProductsMessage,
    mobilesProducts,
    //
    perfumesProductsState,
    perfumesProductsMessage,
    perfumesProducts,
    //
    houseAndKitchenProductsState,
    houseAndKitchenProductsMessage,
    houseAndKitchenProducts,
    //
    electronicEquipmentProductsState,
    electronicEquipmentProductsMessage,
    electronicEquipmentProducts,
    //
    makeUpProductsState,
    makeUpProductsMessage,
    makeUpProducts,
    //
    petsProductsState,
    petsProductsMessage,
    petsProducts,
    //
    categoryProducts,
    categoryProductsMessage,
    categoryProductsState,

  //attribute terms
    brandsTerms,
    brandsTermsMessage,
    brandsTermsState


  ];
}
