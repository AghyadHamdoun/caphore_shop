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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: SizedBox(
        width: 170.w,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 5.r,
                blurStyle: BlurStyle.outer,
                spreadRadius: 5.r,
                color: Colors.grey),
          ], borderRadius: BorderRadius.circular(20.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 150.h,
                  width: 160.w,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: NetworkImage(
                          image,
                        ),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: SizedBox(
                    height: 60.h,
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
                SizedBox(
                  height: 42.h,
                  width: 170.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 42.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "$orginalprice ",
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 10.sp,
                                      color: Colors.grey),
                                ),
                                (price == "33")
                                    ? Text(
                                        " تواصل لمعرفةالسعر",
                                        style: TextStyle(
                                            color: AppColor.accentColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "$price ل.س ",
                                        style: TextStyle(
                                            color: AppColor.accentColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/images/buy.svg',
                            color: AppColor.accentColor,
                            height: 20.h,
                            width: 25.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 // CachedNetworkImage(
     //           height: 150.h,
       //         width: double.infinity,
         //       imageUrl: image,
           //     errorWidget:
             //      (BuildContext context, String url, dynamic error) =>
               //        Image.asset('assets/images/TT copy.png'),
              //),