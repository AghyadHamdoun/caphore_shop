import 'package:cached_network_image/cached_network_image.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String productname;
  final String price;
  final String orginalprice;
  final String image;
  const ProductCard({
    super.key, required this.productname, required this.price, required this.orginalprice, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15)
      ),
      width: 150.w,
      child: Card(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              CachedNetworkImage(
                height: 150.h,
                width: double.infinity,
                imageUrl: image,
                errorWidget: (BuildContext context,
                    String url,
                    dynamic error)=>const Icon(Icons.error),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 5.h),
                child: SizedBox(
                  child: Text(
                   productname ,
                    style: TextStyle(fontSize: 16.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
             const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  children: [
                    Column(children: [
                      Text(
                        orginalprice,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12.sp,
                            color: Colors.grey),
                      ),
                      Text(
                        price,
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),

                    ],),
                    Spacer(),
                    Icon(
                      Icons.shopping_bag,
                      color: AppColor.accentColor,
                      size: 25.r,
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
