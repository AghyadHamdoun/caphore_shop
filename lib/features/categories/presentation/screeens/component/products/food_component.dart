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

class FoodComponent extends StatelessWidget {
  const FoodComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.foodProductsState != current.foodProductsState,
      builder: (context, state) {
        switch (state.foodProductsState) {
          case RequestState.loading:
            return SizedBox(
              height: size.height / 2.6,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/digishi.json',
                  width: 250.w,
                  height: size.height / 2.5,
                  fit: BoxFit.fill,
                ),
              ),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 1000),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                child: SizedBox(
                  height: size.height / 2.6,
                  width: double.infinity.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.foodProducts.length < 10
                        ? state.foodProducts.length
                        : 10,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        product: state.foodProducts[index],
                                        products: state.foodProducts,
                                      )));
                        },
                        child: ProductCard(
                          productname: state.foodProducts[index].name,
                          price: state.foodProducts[index].price,
                          orginalprice: state.foodProducts[index].regularPrice,
                          image: state.foodProducts[index].images.isNotEmpty
                              ? state.foodProducts[index].images[0].src
                              : '',
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.foodProductsMessage),
              ),
            );
        }
      },
    );
  }
}
