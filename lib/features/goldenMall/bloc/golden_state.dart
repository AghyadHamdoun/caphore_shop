import 'package:caphore/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../categories/domain/entities/products.dart';

class GoldenState extends Equatable {
  //1
  final List<Product> basketProducts;
  final RequestState basketProductsState;
  final String basketProductsMessage;

  //2
  const GoldenState(
      {this.basketProducts = const [],
      this.basketProductsState = RequestState.loading,
      this.basketProductsMessage = ''});

  GoldenState copyWith({
    //3
    final List<Product>? basketProducts,
    final RequestState? basketProductsState,
    final String? basketProductsMessage,
  }) {
    // 4
    return GoldenState(
      basketProducts: basketProducts ?? this.basketProducts,
      basketProductsState: basketProductsState ?? this.basketProductsState,
      basketProductsMessage:
          basketProductsMessage ?? this.basketProductsMessage,
    );
  }

  @override
  // 5
  List<Object?> get props =>
      [basketProducts, basketProductsState, basketProductsMessage];
}
