import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MallBannersComponent extends StatelessWidget {
  const MallBannersComponent({
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
            List<String> banners = state.bannersTerms[2].description.split(';');
            for (int i = 0; i < banners.length; i++) {
              images.add(banners[i]);
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height / 6,
                child: CarouselView(
                  itemExtent: size.width,
                  itemSnapping: true,
                  scrollDirection: Axis.horizontal,
                  elevation: 5,
                  padding: EdgeInsets.all(5.h),
                  children: List.generate(
                    images.length,
                    (int index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(images[index]),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // options: CarouselOptions(
              //     onPageChanged: (index, reason) {
              //       bloc.add(CurrentSliderEvent(currentSlider: index));
              //     },
              //     autoPlay: true,
              //     enableInfiniteScroll: true,
              //     aspectRatio: 2.1.r,
              //     viewportFraction: 1,
              //     enlargeCenterPage: true),

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
