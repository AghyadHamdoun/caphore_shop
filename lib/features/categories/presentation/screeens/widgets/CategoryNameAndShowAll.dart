import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryNameAndShowAll extends StatelessWidget {
  final String name;
  const CategoryNameAndShowAll({
    super.key, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical:5.h),
      height: 40.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text("المنتجات الجديدة",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),
          InkWell(
onTap:(){},
            child: Row(
              children: [

                Text(
                  "عرض الكل",
                  style: TextStyle(fontSize: 16.sp, color:AppColor.accentColor,fontWeight: FontWeight.bold),
                ),
                Icon(Icons.keyboard_arrow_left,size: 30.r,color: AppColor.accentColor,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
