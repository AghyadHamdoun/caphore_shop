import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/storeproducts.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

class ImageSliderWithIndex extends StatelessWidget {
  const ImageSliderWithIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int current = 0;
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        List<String> images = [];
        List<String> attributeName = [];
        List<String> termId = [];

        if (state.bannersTerms.isNotEmpty) {
          List<String> banners = state.bannersTerms[0].description.split(';');
          for (int i = 0; i < banners.length; i += 3) {
            images.add(banners[i]);
            attributeName.add(banners[i + 1]);
            termId.add(banners[i + 2]);
          }
        }
        return Column(
          children: [
            CarouselSlider(
              items: images.mapIndexed(
                (ind, item) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreProducts(
                            event: GetTermProductsEvent(
                                attribute: attributeName[ind],
                                termId: int.parse(termId[ind]),
                                perPage: 100,
                                pageNum: 1),
                            storeName: 'الماركات',
                            image: item,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Container(
                        height: 180.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(item),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    current = index;
                  },
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  aspectRatio: 2.1.r,
                  viewportFraction: 1,
                  enlargeCenterPage: true),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 160.w),
              child: SizedBox(
                height: 10.h,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 10.h,
                        width: 10.w,
                        margin: EdgeInsets.symmetric(horizontal: 5.h),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: current == index ? Colors.orange : Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
