import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class TermProductComponent extends StatelessWidget {
  const TermProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      buildWhen: (previous, current) =>
          previous.termProductsState != current.termProductsState,
      builder: (context, state) {
        switch (state.termProductsState) {
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
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.66.r),
              itemCount: state.termProducts.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductScreen(
                                  product: state.termProducts[index],
                                  products: state.termProducts,
                                )));
                  },
                  child: ProductCard(
                    productname: state.termProducts[index].name,
                    price: state.termProducts[index].price,
                    orginalprice: state.termProducts[index].regularPrice,
                    image: state.termProducts[index].images.isNotEmpty
                        ? state.termProducts[index].images[0].src
                        : '',
                  ),
                );
              },
            );
          case RequestState.error:
            return SizedBox(
              height: 280.h,
              child: Center(
                child: Text(state.termProductsMessage),
              ),
            );
        }
      },
    );
  }
}
