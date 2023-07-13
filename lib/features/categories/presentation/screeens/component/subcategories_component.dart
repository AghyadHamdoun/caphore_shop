import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/salesavatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriesComponent extends StatelessWidget {
  const SubCategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
        buildWhen: (previous, current) => (previous.categoriesByParentState !=
            current.categoriesByParentState),
        builder: (context, state) {
          return Container(
            color: Colors.white12,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            height: 152.h,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categoriesByParent.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CategoryProducts(
                                    event: GetGategoryProductsEvent(
                                        pageNum: 1,
                                        categoryId:
                                            state.categoriesByParent[index].id,
                                        perPage: 100),
                                    categoryName:
                                        state.categoriesByParent[index].name,
                                  )));
                    },
                    child: SalesAvatar(
                        name: state.categoriesByParent[index].name,
                        image: state.categoriesByParent[index].image.src));
              },
            ),
          );
        });
  }
}
