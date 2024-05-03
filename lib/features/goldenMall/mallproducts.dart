import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/mallsubcategories.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/H_CategoryProductsComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/MallBannersComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/goldenMall/mall_HcategoriesProductComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/dynamicshowall.dart';
import 'package:caphore/features/goldenMall/mallshowall.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class MallProductsComponent extends StatelessWidget {
  const MallProductsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var bloc = sl<CategoriesBloc>();
    return BlocProvider(
      create: (context) => bloc
        ..add(const GetCategoriesByParentEvent(
          parent: 693,
        )),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
          buildWhen: (previous, current) =>
              (previous.categoriesByParent != current.categoriesByParent),
          builder: (context, state) {
            return (state.categoriesByParent.isEmpty)
                ? Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/digishi.json',
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.categoriesByParent.length,
                      itemBuilder: (BuildContext context, int index) {
                        return DelayedDisplay(
                          delay: Duration(seconds: 1 + (index)),
                          slidingCurve: Curves.easeInOut,
                          fadeIn: true,
                          fadingDuration: Duration(seconds: 2 + (index)),
                          slidingBeginOffset: Offset(size.width, 0),
                          child: Column(
                            children: [
                              (index == 0)
                                  ? MallBannersComponent()
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              (index == 0)
                                  ? MallsubCategoriesComponent()
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              CategoryNameAndShowAll(
                                name: state.categoriesByParent[index].name,
                                showAllCallBack: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => mallshowall(
                                          event: GetCategoryProductsEvent(
                                              pageNum: 1,
                                              categoryId: state
                                                  .categoriesByParent[index].id,
                                              perPage: 100,
                                              lastProducts: []),
                                          categoryName: state
                                              .categoriesByParent[index].name,
                                          categoryId: state
                                              .categoriesByParent[index].id),
                                    ),
                                  );
                                },
                              ),
                              mallH_CategoryProductsComponent(
                                  event: GetCategoryProductsEvent(
                                      pageNum: 1,
                                      categoryId:
                                          state.categoriesByParent[index].id,
                                      perPage: 100,
                                      lastProducts: []),
                                  categoryId:
                                      state.categoriesByParent[index].id),
                            ],
                          ),
                        );
                      },
                    ),
                  );
          }),
    );
  }
}
