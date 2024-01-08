import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:caphore/features/goldenMall/mallproductcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class mallCategoryProductComponent extends StatelessWidget {
  final CategoriesEvent event;
  final int categoryId;

  mallCategoryProductComponent(
      {Key? key, required this.event, required this.categoryId})
      : super(key: key);

  int pageNumber = 2;

  @override
  Widget build(BuildContext context) {
    var bloc = sl<CategoriesBloc>();
    return BlocProvider(
      create: (context) => bloc..add(event),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          switch (state.categoryProductsState) {
            case RequestState.loading:
              return Container(
                alignment: Alignment.center,
                child: Center(
                  child: Lottie.asset(
                    'assets/lottie/digishi.json',
                    fit: BoxFit.fill,
                  ),
                ),
              );
            case RequestState.loaded:
              return Column(
                children: [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.59),
                    itemCount: state.categoryProducts.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        product: state.categoryProducts[index],
                                        products: state.categoryProducts,
                                      )));
                        },
                        child: MallProductCard(
                          product: state.categoryProducts[index],
                        ),
                      );
                    },
                  ),
                  if (state.loadMore == RequestState.loaded)
                    InkWell(
                      onTap: () {
                        bloc.add(GetCategoryProductsEvent(
                            pageNum: ++pageNumber,
                            categoryId: categoryId,
                            perPage: 26,
                            lastProducts: state.categoryProducts));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.accentColor,
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
                        height: 30.h,
                        width: 0.4.sw,
                        child: Text(
                          'عرض المزيد',
                          style: TextStyle(
                              color: AppColor.whiteColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  else
                    state.loadMore == RequestState.loading
                        ? LottieBuilder.asset('assets/lottie/loading.json')
                        : SizedBox(),
                ],
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.menClothingProductsMessage),
                ),
              );
          }
        },
      ),
    );
  }
}
