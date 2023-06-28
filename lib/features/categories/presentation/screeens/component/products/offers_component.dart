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

class OffersProductsComponent extends StatelessWidget {
  const OffersProductsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.offersProductsState != current.offersProductsState,
      builder: (context, state) {
        switch (state.offersProductsState) {
          case RequestState.loading:
            return SizedBox(
              height: 310.h,
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
                  height: 310.h,
                  width: double.infinity.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.offersProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductScreen(
                                        product: state.offersProducts[index],
                                        products: state.offersProducts,
                                      )));
                        },
                        child: ProductCard(
                          productname: state.offersProducts[index].name,
                          price: state.offersProducts[index].price,
                          orginalprice:
                              state.offersProducts[index].regularPrice,
                          image: state.offersProducts[index].images.isNotEmpty
                              ? state.offersProducts[index].images[0].src
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
                child: Text(state.offersProductsMessage),
              ),
            );
        }
      },
    );
  }
}
