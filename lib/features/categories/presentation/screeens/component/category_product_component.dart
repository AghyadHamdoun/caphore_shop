import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryProductComponent extends StatelessWidget {
  const CategoryProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) =>
          previous.categoryProductsState != current.categoryProductsState,
      builder: (context, state) {
        switch (state.categoryProductsState) {
          case RequestState.loading:
            return Container(
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/digishi.json',
                  fit: BoxFit.cover,
                ),
              ),
            );
          case RequestState.loaded:
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.55.r),
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
                  child: ProductCard(
                    productname: state.categoryProducts[index].name,
                    price: state.categoryProducts[index].price,
                    orginalprice: state.categoryProducts[index].regularPrice,
                    image: state.categoryProducts[index].images.isNotEmpty
                        ? state.categoryProducts[index].images[0].src
                        : '',
                  ),
                );
              },
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
