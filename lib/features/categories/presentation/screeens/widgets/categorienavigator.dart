import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/sub_categories.dart';
import 'package:flutter/material.dart';

categorienavigator(int id, String name, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SubCategoryProducts(
        event: GetCategoryProductsEvent(
            pageNum: 1, categoryId: id, perPage: 100, lastProducts: const []),
        categoryName: name,
        subEvent: GetCategoriesByParentEvent(parent: id),
        categoryId: id,
      ),
    ),
  );
}
