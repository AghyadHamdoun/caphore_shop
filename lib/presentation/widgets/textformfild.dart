import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_color.dart';

class maintextform extends StatelessWidget {
  const maintextform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.primaryColor,
          hintText: "CAPHORE",
          hintStyle: TextStyle(fontSize: 16.sp, color: AppColor.accentColor),
          suffixIcon: Icon(
            Icons.notifications,
            size: 28.sp,
            color: AppColor.accentColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
