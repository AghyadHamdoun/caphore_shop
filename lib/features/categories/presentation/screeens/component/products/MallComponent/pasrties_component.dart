import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class PastriesComponent extends StatelessWidget {
  final CategoriesEvent event;
  final int categoryId;

  PastriesComponent({Key? key, required this.event, required this.categoryId})
      : super(key: key);

  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  SizedBox(
                    height: size.height / 2.5,
                    width: double.infinity.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoryProducts.length < 10
                          ? state.categoryProducts.length
                          : 10,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductScreen(
                                          product:
                                              state.categoryProducts[index],
                                          products: state.categoryProducts,
                                        )));
                          },
                          child: ProductCard(
                            productname: state.categoryProducts[index].name,
                            price: state.categoryProducts[index].price,
                            orginalprice:
                                state.categoryProducts[index].regularPrice,
                            image: state
                                    .categoryProducts[index].images.isNotEmpty
                                ? state.categoryProducts[index].images[0].src
                                : '',
                          ),
                        );
                      },
                    ),
                  ),
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
