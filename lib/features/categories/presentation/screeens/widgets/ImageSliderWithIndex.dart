import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderWithIndex extends StatelessWidget {
  const ImageSliderWithIndex({
    super.key,
    required this.imeges,
  });

  final List<String> imeges;

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
                    height: 170.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(item), fit: BoxFit.cover),
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
              autoPlay: false,
              aspectRatio: 2,
              enlargeCenterPage: true),
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
                      color: current == index ? Colors.blue : Colors.grey,
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
