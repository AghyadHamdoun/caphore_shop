import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/salesavatar.dart';
import 'package:caphore/features/goldenMall/mallcategoryproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mall_sub_sub_sub_category extends StatelessWidget {
  const Mall_sub_sub_sub_category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          (previous.categoriesByChildState != current.categoriesByChildState),
      builder: (context, state) {
        return (state.categoriesByChild.isEmpty)
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
                  itemCount: state.categoriesByChild.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          print(state.categoriesByChild[index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mallCategoryProducts(
                                        event: GetCategoryProductsEvent(
                                            pageNum: 1,
                                            categoryId: state
                                                .categoriesByChild[index].id,
                                            perPage: 100,
                                            lastProducts: []),
                                        categoryName:
                                            state.categoriesByChild[index].name,
                                        categoryId:
                                            state.categoriesByChild[index].id,
                                      )));
                        },
                        child: SalesAvatar(
                            name: state.categoriesByChild[index].name,
                            image: state.categoriesByChild[index].image.src));
                  },
                ),
              );
      },
    );
  }
}
