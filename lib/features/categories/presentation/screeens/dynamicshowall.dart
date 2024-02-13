import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/H_CategoryProductsComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/component/subcategories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class dynamicshowall extends StatelessWidget {
  final int categoryId;
  final String categoryName;
  final CategoriesEvent event;

  const dynamicshowall(
      {Key? key,
      required this.categoryId,
      required this.categoryName,
      required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = sl<CategoriesBloc>();
    return BlocProvider(
      create: (context) => bloc
        ..add(GetCategoriesByParentEvent(
          parent: categoryId,
        )),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
          buildWhen: (previous, current) =>
              (previous.categoriesByParent != current.categoriesByParent),
          builder: (context, state) {
            return (state.categoriesByParent.isEmpty)
                ? CategoryProducts(
                    event: event,
                    categoryName: categoryName,
                    categoryId: categoryId)
                : SafeArea(
                    child: Scaffold(
                      body: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 3.h, left: 5.w, right: 5.w, bottom: 0),
                            child: const maintextform(),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: BouncingScrollPhysics(),
                              itemCount: state.categoriesByParent.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    (index == 0)
                                        ? SubCategoriesComponent()
                                        : const SizedBox(
                                            height: 0,
                                            width: 0,
                                          ),
                                    CategoryNameAndShowAll(
                                      name:
                                          state.categoriesByParent[index].name,
                                      showAllCallBack: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CategoryProducts(
                                              event: GetCategoryProductsEvent(
                                                  categoryId: state
                                                      .categoriesByParent[index]
                                                      .id,
                                                  pageNum: 1,
                                                  perPage: 100,
                                                  lastProducts: []),
                                              categoryName: state
                                                  .categoriesByParent[index]
                                                  .name,
                                              categoryId: state
                                                  .categoriesByParent[index].id,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    H_CategoryProductsComponent(
                                        event: GetCategoryProductsEvent(
                                            pageNum: 1,
                                            categoryId: state
                                                .categoriesByParent[index].id,
                                            perPage: 100,
                                            lastProducts: []),
                                        categoryId:
                                            state.categoriesByParent[index].id),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          }),
    );
  }
}
