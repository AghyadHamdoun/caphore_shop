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
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/subcategories");
      },
      child: Card(

          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(10.r),
            side: BorderSide(color: AppColor.accentColor,width: 2.w )
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          child:  CachedNetworkImage(
            height: 40.h,
            width: 40.w,
            imageUrl: image,
            errorWidget: (context, url, error) => Image.asset('assets/images/TT copy.png'),
          ),),
    );
  }
}
