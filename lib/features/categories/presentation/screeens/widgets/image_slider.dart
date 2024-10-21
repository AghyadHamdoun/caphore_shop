import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imeges;
  const ImageSlider({
    super.key,
    required this.imeges,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 6,
      child: CarouselView(
        itemExtent: size.width,
        itemSnapping: true,
        scrollDirection: Axis.horizontal,
        elevation: 5,
        padding: EdgeInsets.all(5.h),
        children: List.generate(
          imeges.length,
          (int index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imeges[index]), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//  height: 270.h,
        //        width: 400.w,
    //      CarouselSlider(
    //   items: imeges
    //       .map(
    //         (item) => Padding(
    //           padding: EdgeInsets.only(bottom: 10.h),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: NetworkImage(item), fit: BoxFit.fill),
    //               borderRadius: BorderRadius.circular(20.r),
    //             ),
    //           ),
    //         ),
    //       )
    //       .toList(),
    //   options: CarouselOptions(
    //       autoPlay: false, aspectRatio: 0.6, enlargeCenterPage: false),
    // );