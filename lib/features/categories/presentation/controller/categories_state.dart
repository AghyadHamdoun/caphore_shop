import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/domain/entities/categories.dart';
import 'package:equatable/equatable.dart';

class CategoriesState extends Equatable {
  final List<Category> allCategories;
  final RequestState allCategoriesState;
  final String allCategoriesMessage;

  const CategoriesState(
      {this.allCategories = const [],
      this.allCategoriesState = RequestState.loading,
      this.allCategoriesMessage = ''});

  CategoriesState copyWith({
    final List<Category>? allCategories,
    final RequestState? allCategoriesState,
    final String? allCategoriesMessage,
  }) {
    return CategoriesState(
        allCategories: allCategories ?? this.allCategories,
        allCategoriesState: allCategoriesState ?? this.allCategoriesState,
        allCategoriesMessage:
            allCategoriesMessage ?? this.allCategoriesMessage);
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [allCategories, allCategoriesMessage, allCategoriesState];
}
