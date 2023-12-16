import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/sub_categories.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/salesavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        buildWhen: (previous, current) =>
            previous.allCategoriesState != current.allCategoriesState,
        builder: (context, state) {
          return Container(
            color: Colors.white12,
            height: size.height / 4.9,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.allCategories.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      print(state.allCategories[index].id);
                      print(state.allCategories[index].name);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubCategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        pageNum: 1,
                                        categoryId:
                                            state.allCategories[index].id,
                                        perPage: 100,
                                        lastProducts: []),
                                    categoryName:
                                        state.allCategories[index].name,
                                    subEvent: GetCategoriesByParentEvent(
                                        parent: state.allCategories[index].id),
                                    categoryId: state.allCategories[index].id,
                                  )));
                    },
                    child: SalesAvatar(
                        name: state.allCategories[index].name,
                        image: state.allCategories[index].image.src));
              },
            ),
          );
        });
  }
}
