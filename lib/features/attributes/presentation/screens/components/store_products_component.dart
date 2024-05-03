import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class TermProductComponent extends StatelessWidget {
  final String attribute;
  final int termid;
  TermProductComponent(
      {Key? key, required this.attribute, required this.termid})
      : super(key: key);
  int pageNumber = 2;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      buildWhen: (previous, current) =>
          previous.termProductsState != current.termProductsState ||
          previous.loadMore != current.loadMore,
      builder: (context, state) {
        switch (state.termProductsState) {
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.62),
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
                ),
                if (state.loadMore == RequestState.loaded)
                  InkWell(
                    onTap: () {
                      print("widget${state.termProducts.length}");
                      print("load");
                      context.read<AttributesBloc>().add(GetTermProductsEvent(
                          attribute: attribute,
                          termId: termid,
                          pageNum: pageNumber++,
                          perPage: 26));
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
                      : const SizedBox(),
              ],
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
