import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/attributes_event.dart';
import '../../../controller/attributes_state.dart';
import '../../storeproducts.dart';

class BrandsComponentHorizontal extends StatelessWidget {
  const BrandsComponentHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        switch (state.brandsTermsState) {
          case RequestState.loading:
            return Container(
              alignment: Alignment.center,
              child: Center(
                child: Lottie.asset('assets/lottie/waiting.json',
                    fit: BoxFit.fill, height: 250.h),
              ),
            );
          case RequestState.loaded:
            return SizedBox(
              height: size.height / 7,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                itemCount: state.brandsTerms.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreProducts(
                            attribute: 'brand',
                            termid: state.brandsTerms[index].id,
                            event: GetTermProductsEvent(
                                attribute: 'brand',
                                termId: state.brandsTerms[index].id,
                                perPage: 20,
                                pageNum: 1),
                            storeName: state.brandsTerms[index].name,
                            image: (state.brandsTerms[index].description
                                        .split(';')[2])
                                    .isEmpty
                                ? ''
                                : (state.brandsTerms[index].description
                                    .split(';')[2]),
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 120.h,
                      child: CategoryCard(
                        name: state.brandsTerms[index].name,
                        image:
                            (state.brandsTerms[index].description.split(';')[1])
                                    .isEmpty
                                ? ''
                                : (state.brandsTerms[index].description
                                    .split(';')[1]),
                      ),
                    ),
                  );
                },
              ),
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
