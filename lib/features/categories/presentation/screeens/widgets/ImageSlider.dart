import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imeges;
  const ImageSlider({
    super.key,
    required this.imeges,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imeges
          .map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(item), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
          autoPlay: false, aspectRatio: 0.6, enlargeCenterPage: false),
    );
  }
}
//  height: 270.h,
        //        width: 400.w,