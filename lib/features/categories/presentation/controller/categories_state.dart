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
//
  final List<Term> clothingTerms;
  final RequestState clothingTermsState;
  final String clothingTermsMessage;
  //
  final List<Term> shoesandbagsTerms;
  final RequestState shoesandbagsTermsState;
  final String shoesandbagsTermsMessage;
  //
  final List<Term> electronicequipmentTerms;
  final RequestState electronicequipmentTermsState;
  final String electronicequipmentTermsMessage;
//
  final List<Term> houseandkitchenTerms;
  final RequestState houseandkitchenTermsState;
  final String houseandkitchenTermsMessage;
  //
  final List<Term> makeupTerms;
  final RequestState makeupTermsState;
  final String makeupTermsMessage;
  //
  final List<Term> watchesandaccessoriesTerms;
  final RequestState watchesandaccessoriesTermsState;
  final String watchesandaccessoriesTermsMessage;
  //
  final List<Term> perfumesTerms;
  final RequestState perfumesTermsState;
  final String perfumesTermsMessage;
  //
  final List<Term> handmadeTerms;
  final RequestState handmadeTermsState;
  final String handmadeTermsMessage;
  //
  final List<Term> petsTerms;
  final RequestState petsTermsState;
  final String petsTermsMessage;
  //
  final List<Term> toysTerms;
  final RequestState toysTermsState;
  final String toysTermsMessage;
  //
  final List<Term> fastfoodTerms;
  final RequestState fastfoodTermsState;
  final String fastfoodTermsMessage;
  //
  final List<Term> arabfoodTerms;
  final RequestState arabfoodTermsState;
  final String arabfoodTermsMessage;
  //
  final List<Term> sweetTerms;
  final RequestState sweetTermsState;
  final String sweetTermsMessage;
  //
  final List<Term> coffeTerms;
  final RequestState coffeTermsState;
  final String coffeTermsMessage;
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
    this.brandsTermsMessage = '',
    //
    this.clothingTerms = const [],
    this.clothingTermsState = RequestState.loading,
    this.clothingTermsMessage = '',
    //
    this.shoesandbagsTerms = const [],
    this.shoesandbagsTermsState = RequestState.loading,
    this.shoesandbagsTermsMessage = '',
    //
    this.electronicequipmentTerms = const [],
    this.electronicequipmentTermsState = RequestState.loading,
    this.electronicequipmentTermsMessage = '',
    //
    this.houseandkitchenTerms = const [],
    this.houseandkitchenTermsState = RequestState.loading,
    this.houseandkitchenTermsMessage = '',
    //
    this.makeupTerms = const [],
    this.makeupTermsState = RequestState.loading,
    this.makeupTermsMessage = '',
    //
    this.watchesandaccessoriesTerms = const [],
    this.watchesandaccessoriesTermsState = RequestState.loading,
    this.watchesandaccessoriesTermsMessage = '',
    //
    this.perfumesTerms = const [],
    this.perfumesTermsState = RequestState.loading,
    this.perfumesTermsMessage = '',
    //
    this.handmadeTerms = const [],
    this.handmadeTermsState = RequestState.loading,
    this.handmadeTermsMessage = '',
    //
    this.petsTerms = const [],
    this.petsTermsState = RequestState.loading,
    this.petsTermsMessage = '',
    //
    this.toysTerms = const [],
    this.toysTermsState = RequestState.loading,
    this.toysTermsMessage = '',
    //
    this.fastfoodTerms = const [],
    this.fastfoodTermsState = RequestState.loading,
    this.fastfoodTermsMessage = '',
    //
    this.arabfoodTerms = const [],
    this.arabfoodTermsState = RequestState.loading,
    this.arabfoodTermsMessage = '',
    //
    this.sweetTerms = const [],
    this.sweetTermsState = RequestState.loading,
    this.sweetTermsMessage = '',
    //
    this.coffeTerms = const [],
    this.coffeTermsState = RequestState.loading,
    this.coffeTermsMessage = '',
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
    final List<Product>? houseAndKitchenProducts,
    final RequestState? houseAndKitchenProductsState,
    final String? houseAndKitchenProductsMessage,
    //
    final List<Product>? electronicEquipmentProducts,
    final RequestState? electronicEquipmentProductsState,
    final String? electronicEquipmentProductsMessage,
    //
    final List<Product>? makeUpProducts,
    final RequestState? makeUpProductsState,
    final String? makeUpProductsMessage,
    //
    final List<Product>? petsProducts,
    final RequestState? petsProductsState,
    final String? petsProductsMessage,
    //
    final List<Product>? categoryProducts,
    final RequestState? categoryProductsState,
    final String? categoryProductsMessage,

    // attribute terms

    final List<Term>? brandsTerms,
    final RequestState? brandsTermsState,
    final String? brandsTermsMessage,
    //
    final List<Term>? clothingTerms,
    final RequestState? clothingTermsState,
    final String? clothingTermsMessage,
    //
    final List<Term>? shoesandbagsTerms,
    final RequestState? shoesandbagsTermsState,
    final String? shoesandbagsTermsMessage,
    //
    final List<Term>? electronicequipmentTerms,
    final RequestState? electronicequipmentTermsState,
    final String? electronicequipmentTermsMessage,
    //
    final List<Term>? houseandkitchenTerms,
    final RequestState? houseandkitchenTermsState,
    final String? houseandkitchenTermsMessage,
    //
    final List<Term>? makeupTerms,
    final RequestState? makeupTermsState,
    final String? makeupTermsMessage,
    //
    final List<Term>? watchesandaccessoriesTerms,
    final RequestState? watchesandaccessoriesTermsState,
    final String? watchesandaccessoriesTermsMessage,
    //
    final List<Term>? perfumesTerms,
    final RequestState? perfumesTermsState,
    final String? perfumesTermsMessage,
    //
    final List<Term>? handmadeTerms,
    final RequestState? handmadeTermsState,
    final String? handmadeTermsMessage,
    //
    final List<Term>? petsTerms,
    final RequestState? petsTermsState,
    final String? petsTermsMessage,
    //
    final List<Term>? toysTerms,
    final RequestState? toysTermsState,
    final String? toysTermsMessage,
    //
    final List<Term>? fastfoodTerms,
    final RequestState? fastfoodTermsState,
    final String? fastfoodTermsMessage,
    //
    final List<Term>? arabfoodTerms,
    final RequestState? arabfoodTermsState,
    final String? arabfoodTermsMessage,
    //
    final List<Term>? sweetTerms,
    final RequestState? sweetTermsState,
    final String? sweetTermsMessage,
    //
    final List<Term>? coffeTerms,
    final RequestState? coffeTermsState,
    final String? coffeTermsMessage,
  }) {
    return CategoriesState(
      // 4
      categoryParents: categoryParents ?? this.categoryParents,
      allCategories: allCategories ?? this.allCategories,
      allCategoriesState: allCategoriesState ?? this.allCategoriesState,
      allCategoriesMessage: allCategoriesMessage ?? this.allCategoriesMessage,
      product: product ?? this.product,
      productState: productState ?? this.productState,
      productMessage: productMessage ?? this.productMessage,
      lastProducts: lastProducts ?? this.lastProducts,
      lastProductsState: lastProductsState ?? this.lastProductsState,
      lastProductsMessage: lastProductsMessage ?? this.lastProductsMessage,
      //
      brandsProducts: brandsProducts ?? this.brandsProducts,
      brandsProductsState: brandsProductsState ?? this.brandsProductsState,
      brandsProductsMessage:
          brandsProductsMessage ?? this.brandsProductsMessage,
      //
      womenClothingProducts:
          womenClothingProducts ?? this.womenClothingProducts,
      womenClothingProductsState:
          womenClothingProductsState ?? this.womenClothingProductsState,
      womenClothingProductsMessage:
          womenClothingProductsMessage ?? this.womenClothingProductsMessage,
      //
      menClothingProducts: menClothingProducts ?? this.menClothingProducts,
      menClothingProductsState:
          menClothingProductsState ?? this.menClothingProductsState,
      menClothingProductsMessage:
          menClothingProductsMessage ?? this.menClothingProductsMessage,
      //
      childrenClothingProducts:
          childrenClothingProducts ?? this.childrenClothingProducts,
      childrenClothingProductsState:
          childrenClothingProductsState ?? this.childrenClothingProductsState,
      childrenClothingProductsMessage: childrenClothingProductsMessage ??
          this.childrenClothingProductsMessage,
      //
      foodProducts: foodProducts ?? this.foodProducts,
      foodProductsState: foodProductsState ?? this.foodProductsState,
      foodProductsMessage: foodProductsMessage ?? this.foodProductsMessage,
      //
      shoesAndBagsProducts: shoesAndBagsProducts ?? this.shoesAndBagsProducts,
      shoesAndBagsProductsState:
          shoesAndBagsProductsState ?? this.shoesAndBagsProductsState,
      shoesAndBagsProductsMessage:
          shoesAndBagsProductsMessage ?? this.shoesAndBagsProductsMessage,
      //
      watchesAndAccessoriesProducts:
          watchesAndAccessoriesProducts ?? this.watchesAndAccessoriesProducts,
      watchesAndAccessoriesProductsState: watchesAndAccessoriesProductsState ??
          this.watchesAndAccessoriesProductsState,
      watchesAndAccessoriesProductsMessage:
          watchesAndAccessoriesProductsMessage ??
              this.watchesAndAccessoriesProductsMessage,
      //
      mobilesProducts: mobilesProducts ?? this.mobilesProducts,
      mobilesProductsState: mobilesProductsState ?? this.mobilesProductsState,
      mobilesProductsMessage:
          mobilesProductsMessage ?? this.mobilesProductsMessage,
      //
      perfumesProducts: perfumesProducts ?? this.perfumesProducts,
      perfumesProductsState:
          perfumesProductsState ?? this.perfumesProductsState,
      perfumesProductsMessage:
          perfumesProductsMessage ?? this.perfumesProductsMessage,
      //
      houseAndKitchenProducts:
          houseAndKitchenProducts ?? this.houseAndKitchenProducts,
      houseAndKitchenProductsState:
          houseAndKitchenProductsState ?? this.houseAndKitchenProductsState,
      houseAndKitchenProductsMessage:
          houseAndKitchenProductsMessage ?? this.houseAndKitchenProductsMessage,
      //
      electronicEquipmentProducts:
          electronicEquipmentProducts ?? this.electronicEquipmentProducts,
      electronicEquipmentProductsState: electronicEquipmentProductsState ??
          this.electronicEquipmentProductsState,
      electronicEquipmentProductsMessage: electronicEquipmentProductsMessage ??
          this.electronicEquipmentProductsMessage,
      //
      makeUpProducts: makeUpProducts ?? this.makeUpProducts,
      makeUpProductsState: makeUpProductsState ?? this.makeUpProductsState,
      makeUpProductsMessage:
          makeUpProductsMessage ?? this.makeUpProductsMessage,
      //
      petsProducts: petsProducts ?? this.petsProducts,
      petsProductsState: petsProductsState ?? this.petsProductsState,
      petsProductsMessage: petsProductsMessage ?? this.petsProductsMessage,
      //
      categoryProducts: categoryProducts ?? this.categoryProducts,
      categoryProductsState:
          categoryProductsState ?? this.categoryProductsState,
      categoryProductsMessage:
          categoryProductsMessage ?? this.categoryProductsMessage,
      //
      brandsTerms: brandsTerms ?? this.brandsTerms,
      brandsTermsState: brandsTermsState ?? this.brandsTermsState,
      brandsTermsMessage: brandsTermsMessage ?? this.brandsTermsMessage,
      //
      clothingTerms: clothingTerms ?? this.clothingTerms,
      clothingTermsState: clothingTermsState ?? this.clothingTermsState,
      clothingTermsMessage: clothingTermsMessage ?? this.clothingTermsMessage,
      //
      shoesandbagsTerms: shoesandbagsTerms ?? this.shoesandbagsTerms,
      shoesandbagsTermsState:
          shoesandbagsTermsState ?? this.shoesandbagsTermsState,
      shoesandbagsTermsMessage:
          shoesandbagsTermsMessage ?? this.shoesandbagsTermsMessage,
      //
      electronicequipmentTerms:
          electronicequipmentTerms ?? this.electronicequipmentTerms,
      electronicequipmentTermsState:
          electronicequipmentTermsState ?? this.electronicequipmentTermsState,
      electronicequipmentTermsMessage: electronicequipmentTermsMessage ??
          this.electronicequipmentTermsMessage,
      //
      houseandkitchenTerms: houseandkitchenTerms ?? this.houseandkitchenTerms,
      houseandkitchenTermsState:
          houseandkitchenTermsState ?? this.houseandkitchenTermsState,
      houseandkitchenTermsMessage:
          houseandkitchenTermsMessage ?? this.houseandkitchenTermsMessage,
      //
      makeupTerms: makeupTerms ?? this.makeupTerms,
      makeupTermsState: makeupTermsState ?? this.makeupTermsState,
      makeupTermsMessage: makeupTermsMessage ?? this.makeupTermsMessage,
      //
      watchesandaccessoriesTerms:
          watchesandaccessoriesTerms ?? this.watchesandaccessoriesTerms,
      watchesandaccessoriesTermsState: watchesandaccessoriesTermsState ??
          this.watchesandaccessoriesTermsState,
      watchesandaccessoriesTermsMessage: watchesandaccessoriesTermsMessage ??
          this.watchesandaccessoriesTermsMessage,
      //
      perfumesTerms: perfumesTerms ?? this.perfumesTerms,
      perfumesTermsState: perfumesTermsState ?? this.perfumesTermsState,
      perfumesTermsMessage: perfumesTermsMessage ?? this.perfumesTermsMessage,
      //
      handmadeTerms: handmadeTerms ?? this.handmadeTerms,
      handmadeTermsState: handmadeTermsState ?? this.handmadeTermsState,
      handmadeTermsMessage: handmadeTermsMessage ?? this.handmadeTermsMessage,
      //
      petsTerms: petsTerms ?? this.petsTerms,
      petsTermsState: petsTermsState ?? this.petsTermsState,
      petsTermsMessage: petsTermsMessage ?? this.petsTermsMessage,
      //
      toysTerms: toysTerms ?? this.toysTerms,
      toysTermsState: toysTermsState ?? this.toysTermsState,
      toysTermsMessage: toysTermsMessage ?? this.toysTermsMessage,
      //
      fastfoodTerms: fastfoodTerms ?? this.fastfoodTerms,
      fastfoodTermsState: fastfoodTermsState ?? this.fastfoodTermsState,
      fastfoodTermsMessage: fastfoodTermsMessage ?? this.fastfoodTermsMessage,
      //
      arabfoodTerms: arabfoodTerms ?? this.arabfoodTerms,
      arabfoodTermsState: arabfoodTermsState ?? this.arabfoodTermsState,
      arabfoodTermsMessage: arabfoodTermsMessage ?? this.arabfoodTermsMessage,
      //
      sweetTerms: sweetTerms ?? this.sweetTerms,
      sweetTermsState: sweetTermsState ?? this.sweetTermsState,
      sweetTermsMessage: sweetTermsMessage ?? this.sweetTermsMessage,
      //
      coffeTerms: coffeTerms ?? this.coffeTerms,
      coffeTermsState: coffeTermsState ?? this.coffeTermsState,
      coffeTermsMessage: coffeTermsMessage ?? this.coffeTermsMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      //5
      [
        allCategories,
        allCategoriesMessage,
        allCategoriesState,
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
        brandsTermsState,
        //
        clothingTerms,
        clothingTermsMessage,
        clothingTermsState,
        //
        shoesandbagsTerms,
        shoesandbagsTermsMessage,
        shoesandbagsTermsState,
        //
        electronicequipmentTerms,
        electronicequipmentTermsMessage,
        electronicequipmentTermsState,
        //
        houseandkitchenTerms,
        houseandkitchenTermsMessage,
        houseandkitchenTermsState,
        //
        makeupTerms,
        makeupTermsMessage,
        makeupTermsState,
        //
        watchesandaccessoriesTerms,
        watchesandaccessoriesTermsMessage,
        watchesandaccessoriesTermsState,
        //
        perfumesTerms,
        perfumesTermsMessage,
        perfumesTermsState,
        //
        handmadeTerms,
        handmadeTermsMessage,
        handmadeTermsState,
        //
        petsTerms,
        petsTermsMessage,
        petsTermsState,
        //
        toysTerms,
        toysTermsMessage,
        toysTermsState,
        //
        fastfoodTerms,
        fastfoodTermsMessage,
        fastfoodTermsState,
        //
        arabfoodTerms,
        arabfoodTermsMessage,
        arabfoodTermsState,
        //
        sweetTerms,
        sweetTermsMessage,
        sweetTermsState,
        //
        coffeTerms,
        coffeTermsMessage,
        coffeTermsState,
      ];
}
