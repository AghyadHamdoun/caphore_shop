import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';

class WatchesandaccessoriesComponent extends StatelessWidget {
  const WatchesandaccessoriesComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.watchesAndAccessoriesProductsState !=
          current.watchesAndAccessoriesProductsState,
      builder: (context, state) {
        switch (state.watchesAndAccessoriesProductsState) {
          case RequestState.loading:
            return SizedBox(
              height: 283.h,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/digishi.json',
                  width: 250.w,
                  height: 280.h,
                  fit: BoxFit.cover,
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: SizedBox(
                  height: 283.h,
                  width: double.infinity.w,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.watchesAndAccessoriesProducts.length < 10
                          ? state.watchesAndAccessoriesProducts.length
                          : 10,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                          product: state
                                                  .watchesAndAccessoriesProducts[
                                              index],
                                          products: state
                                              .watchesAndAccessoriesProducts,
                                        )));
                          },
                          child: ProductCard(
                            productname:
                                state.watchesAndAccessoriesProducts[index].name,
                            price: state
                                .watchesAndAccessoriesProducts[index].price,
                            orginalprice: state
                                .watchesAndAccessoriesProducts[index]
                                .regularPrice,
                            image: state.watchesAndAccessoriesProducts[index]
                                    .images.isNotEmpty
                                ? state.watchesAndAccessoriesProducts[index]
                                    .images[0].src
                                : '',
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.watchesAndAccessoriesProductsMessage),
              ),
            );
        }
      },
    );
  }
}
