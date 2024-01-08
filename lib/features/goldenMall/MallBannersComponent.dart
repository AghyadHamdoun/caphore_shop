import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/storeproducts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

class MallBannersComponent extends StatelessWidget {
  const MallBannersComponent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc
        ..add(const GetBannersTermsEvent(
            pageNum: 1, attributeId: 34, perPage: 100)),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          List<String> images = [];
          List<String> attributeName = [];
          List<String> termId = [];

          if (state.bannersTerms.isNotEmpty) {
            List<String> banners = state.bannersTerms[2].description.split(';');
            for (int i = 0; i < banners.length; i++) {
              images.add(banners[i]);
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                items: images.mapIndexed(
                  (ind, item) {
                    return
                        //  InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => StoreProducts(
                        //           event: GetTermProductsEvent(
                        //               attribute: attributeName[ind],
                        //               termId: int.parse(termId[ind]),
                        //               perPage: 100,
                        //               pageNum: 1),
                        //           storeName: 'الماركات',
                        //           image: item,
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   child:
                        Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    );
                    // );
                  },
                ).toList(),
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      bloc.add(CurrentSliderEvent(currentSlider: index));
                    },
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    aspectRatio: 2.1.r,
                    viewportFraction: 1,
                    enlargeCenterPage: true),
              ),
              SizedBox(
                height: 10.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10.h,
                      width: 10.w,
                      margin: EdgeInsets.symmetric(horizontal: 5.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index == state.currentSlider
                            ? Colors.orange
                            : Colors.grey,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
