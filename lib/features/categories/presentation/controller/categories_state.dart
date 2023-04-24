import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  final List<Category> allCategories;
  final RequestState allCategoriesState;
  final String allCategoriesMessage;
  final Product product;
  final RequestState productState;
  final String productMessage;

  const CategoriesState({
    this.allCategories = const [],
    this.allCategoriesState = RequestState.loading,
    this.allCategoriesMessage = '',
    this.product =const Product(
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
  });

  CategoriesState copyWith({
    final List<Category>? allCategories,
    final RequestState? allCategoriesState,
    final String? allCategoriesMessage,
    final Product? product,
    final RequestState? productState,
    final String? productMessage,
  }) {
    return CategoriesState(
        allCategories: allCategories ?? this.allCategories,
        allCategoriesState: allCategoriesState ?? this.allCategoriesState,
        allCategoriesMessage:
        allCategoriesMessage ?? this.allCategoriesMessage,
        product: product??this.product,
        productState: productState??this.productState,
        productMessage: productMessage??this.productMessage
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [allCategories, allCategoriesMessage, allCategoriesState];
}
