import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class maintextform extends StatelessWidget {
  const maintextform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/Search");
      },
      child: SizedBox(
        height: 60.h,
        child: Form(
          child: TextFormField(
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.primaryColor,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "البحث عن منتجات...  ",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.search,
                      size: 28.sp,
                      color: AppColor.accentColor,
                    ),
                  ],
                ),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Row(
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: 120.w,
                      child: Image.asset(
                        "assets/images/89.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
