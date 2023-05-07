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
      child: Form(
        child: TextFormField(
          enabled: false,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.primaryColor,
            suffixIcon: Icon(
              Icons.search,
              size: 28.sp,
              color: AppColor.accentColor,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Row(
                children: [
                  SizedBox(
                    height: 80.h,
                    width: 90.w,
                    child: Image.asset(
                      "assets/images/TT copy.png",
                      fit: BoxFit.cover,
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
    );
  }
}
