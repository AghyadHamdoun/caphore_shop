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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          items: imeges
              .map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Container(
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
            enableInfiniteScroll: false,
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: 1.1.r,
          ),
        ),
        SizedBox(
          height: 10.h,
          child: ListView.builder(
            shrinkWrap: true,
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
      ],
    );
  }
}
