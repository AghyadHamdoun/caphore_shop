import 'package:cached_network_image/cached_network_image.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  final String productname;
  final String price;
  final String orginalprice;
  final String image;
  const ProductCard({
    super.key,
    required this.productname,
    required this.price,
    required this.orginalprice,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      width: 150.w,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 3.h),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 150.h,
                width: double.infinity,
                imageUrl: image,
                errorWidget:
                    (BuildContext context, String url, dynamic error) =>
                        Image.asset('assets/images/TT copy.png'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: SizedBox(
                  child: Flexible(
                    child: Text(
                      productname,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "$orginalprice ",
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 12.sp,
                              color: Colors.grey),
                        ),
                        Text(
                          "$price ل.س ",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/images/buy.svg',
                      color: AppColor.accentColor,
                      height: 20.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
