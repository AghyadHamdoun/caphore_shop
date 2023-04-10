import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.imeges,
  });

  final List<String> imeges;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imeges
          .map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                height: 170.h,
                width: 350.w,
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
          autoPlay: true, aspectRatio: 2, enlargeCenterPage: true),
    );
  }
}
