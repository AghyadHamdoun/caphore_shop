import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class salesavatar extends StatelessWidget {
  const salesavatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      height: 100.h,
      padding:  EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      child: Column(
        children: [
          CircleAvatar(backgroundColor: Colors.blue, radius: 35.r),
          SizedBox(
            height: 10.h,
          ),
           Text("اسم الصنف",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
