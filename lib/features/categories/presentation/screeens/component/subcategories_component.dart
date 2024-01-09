import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/sub_sub_categories.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/salesavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesComponent extends StatelessWidget {
  const SubCategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        buildWhen: (previous, current) => (previous.categoriesByParentState !=
            current.categoriesByParentState),
        builder: (context, state) {
          return (state.categoriesByParent.isEmpty)
              ? const SizedBox(
                  height: 0,
                  width: 0,
                )
              : Container(
                  color: Colors.white12,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  height: size.height / 4.5,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoriesByParent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            print(state.categoriesByParent[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubSubCategories(
                                  event: GetCategoryProductsEvent(
                                      pageNum: 1,
                                      categoryId:
                                          state.categoriesByParent[index].id,
                                      perPage: 100,
                                      lastProducts: []),
                                  categoryName:
                                      state.categoriesByParent[index].name,
                                  categoryId:
                                      state.categoriesByParent[index].id,
                                  subEvent: GetCategoriesByChildEvent(
                                      parent:
                                          state.categoriesByParent[index].id),
                                ),
                              ),
                            );
                          },
                          child: SalesAvatar(
                              name: state.categoriesByParent[index].name,
                              image:
                                  state.categoriesByParent[index].image.src));
                    },
                  ),
                );
        });
  }
}
