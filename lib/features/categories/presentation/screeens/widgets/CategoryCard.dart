import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;

  const CategoryCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.w,
      child: Card(
        elevation: 4.r,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(color: AppColor.accentColor, width: 2.w)),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: CachedNetworkImage(
            height: 40.h,
            width: 40.w,
            imageUrl: image,
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/TT copy.png'),
          ),
        ),
      ),
    );
  }
}
