import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCard extends StatelessWidget {
  final String image;
  const BrandCard({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 65.h,
              width: 120.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(3, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.r),

              ),
              child:  CachedNetworkImage(
                imageUrl: image,
                errorWidget: (context, url, error) => Image.asset('assets/images/TT copy.png'),
              ),
            ),
          );
        },
      ),
    );
  }
}
