import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Productimageslider extends StatelessWidget {
  final List<String> imeges;
  const Productimageslider({
    super.key,
    required this.imeges,
  });

  @override
  Widget build(BuildContext context) {
    int current = 0;
    return Column(
      children: [
        CarouselSlider(
          items: imeges
              .map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Container(
                    height: 340.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(item),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              current = index;
            },
            enableInfiniteScroll: true,
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 160.w),
          child: SizedBox(
            height: 10.h,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imeges.length,
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
  }
}