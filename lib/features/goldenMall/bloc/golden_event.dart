import 'package:caphore/features/categories/data/models/products_model.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:equatable/equatable.dart';

abstract class GoldenEvent extends Equatable {
  const GoldenEvent();

  @override
  List<Object> get props => [];
}


class AddProductToBasket extends GoldenEvent {
  final Product productModel;

  const AddProductToBasket({required this.productModel});
}

class IncreaseOne extends GoldenEvent {
final int index;
const IncreaseOne({required this.index});
}

class MinusOne extends GoldenEvent {
  final int index;
  const MinusOne({required this.index});
}

class DeleteProductFromBasket extends GoldenEvent{
  final int index;
  const DeleteProductFromBasket({required this.index});
}
class MakeBasketEmpty extends GoldenEvent{
  const MakeBasketEmpty();
}