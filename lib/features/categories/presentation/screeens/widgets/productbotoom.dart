import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottom extends StatelessWidget {
  final String price;
  final String orginalPrice;
  const ProductBottom({
    super.key, required this.price, required this.orginalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(price,style: TextStyle(color: AppColor.primaryColor,fontSize: 20.sp),),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, fixedSize: Size(250.w, 40.h)),
            onPressed: () {},
            icon:const Icon(Icons.call),
            label: Text("اشتري الان",style: TextStyle(fontSize: 18.sp),),
          )
        ],
      ),
    );
  }
}
