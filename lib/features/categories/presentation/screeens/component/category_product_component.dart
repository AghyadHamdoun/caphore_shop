import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CategoryProductComponent extends StatefulWidget {
  const CategoryProductComponent({Key? key}) : super(key: key);

  @override
  State<CategoryProductComponent> createState() =>
      _CategoryProductComponentState();
}

class _CategoryProductComponentState extends State<CategoryProductComponent> {
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
            return  GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8.h),
              itemCount: state.categoryProducts.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  productname: state.categoryProducts[index].name,
                  price: state.categoryProducts[index].price,
                  orginalprice:
                  state.categoryProducts[index].regularPrice,
                  image:
                  state.categoryProducts[index].images[0].src,
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
