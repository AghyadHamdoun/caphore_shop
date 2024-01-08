import 'dart:async';

import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/screens/components/banners_two_component.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/H_CategoryProductsComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/goldenMall/goldenmall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../dynamicshowall.dart';

class Homeproducts extends StatelessWidget {
  const Homeproducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.allCategoriesState != current.allCategoriesState,
      builder: (context, state) {
        switch (state.allCategoriesState) {
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
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (state.allCategories.length < 16)
                    ? state.allCategories.length
                    : 16,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      CategoryNameAndShowAll(
                        name: state.allCategories[index].name,
                        showAllCallBack: () {
                          if (state.allCategories[index].id == 693) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoldenMall()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dynamicshowall(
                                    event: GetCategoryProductsEvent(
                                        pageNum: 1,
                                        categoryId:
                                            state.allCategories[index].id,
                                        perPage: 100,
                                        lastProducts: []),
                                    categoryName:
                                        state.allCategories[index].name,
                                    categoryId: state.allCategories[index].id),
                              ),
                            );
                          }
                        },
                      ),
                      H_CategoryProductsComponent(
                          event: GetCategoryProductsEvent(
                              pageNum: 1,
                              categoryId: state.allCategories[index].id,
                              perPage: 100,
                              lastProducts: []),
                          categoryId: state.allCategories[index].id),
                      (index == 5)
                          ? const ImageSliderTwoWithIndex()
                          : const SizedBox(
                              height: 0,
                              width: 0,
                            )
                    ],
                  );
                },
              ),
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
    );
  }
}
