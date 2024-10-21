import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/storeproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderTwoWithIndex extends StatelessWidget {
  const ImageSliderTwoWithIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            List<String> banners = state.bannersTerms[1].description.split(';');
            for (int i = 0; i < banners.length; i += 3) {
              images.add(banners[i]);
              attributeName.add(banners[i + 1]);
              termId.add(banners[i + 2]);
            }
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height / 4,
                  child: CarouselView(
                    onTap: (index) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreProducts(
                            attribute: attributeName[index],
                            termid: int.parse(termId[index]),
                            event: GetTermProductsEvent(
                                attribute: attributeName[index],
                                termId: int.parse(termId[index]),
                                perPage: 100,
                                pageNum: 1),
                            storeName: 'المطاعم',
                            image: images[index],
                          ),
                        ),
                      );
                    },
                    itemExtent: size.width,
                    itemSnapping: true,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(5.h),
                    children: List.generate(
                      images.length,
                      (int index) {
                        return Column(
                          children: [
                            Container(
                              height: size.height / 4 - 30.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(images[index]),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 10.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: images.length,
                                itemBuilder: (BuildContext context, int i) {
                                  return Container(
                                    height: 10.h,
                                    width: 10.w,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.h),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: i == index
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
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
