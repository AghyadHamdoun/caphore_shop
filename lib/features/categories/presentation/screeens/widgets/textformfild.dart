import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class maintextform extends StatelessWidget {
  const maintextform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/pages");
              },
              child: SizedBox(
                height: 50.h,
                width: 120.w,
                child: Image.asset(
                  "assets/images/89.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/Search");
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "البحث عن منتجات...  ",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 18.sp,
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
            ),
          ],
        ),
      ),
    );
  }
}
// Form(
      //   child: TextFormField(
      //     onTap: () {
      //       Navigator.of(context).pushNamed("/Search");
      //     },
      //     enabled: false,
      //     decoration: InputDecoration(
      //       filled: true,
      //       fillColor: AppColor.primaryColor,
      //       suffixIcon: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 5.w),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           children: [
      //             Text(
      //               "البحث عن منتجات...  ",
      //               style: TextStyle(
      //                   color: AppColor.accentColor,
      //                   fontSize: 16.sp,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //             Icon(
      //               Icons.search,
      //               size: 28.sp,
      //               color: AppColor.accentColor,
      //             ),
      //           ],
      //         ),
      //       ),
      //       prefixIcon: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 6.w),
      //         child: GestureDetector(
      //           onTap: () {
      //             Navigator.of(context).pushNamed("/pages");
      //           },
      //           child: SizedBox(
      //             height: 50.h,
      //             width: 120.w,
      //             child: Image.asset(
      //               "assets/images/89.png",
      //               fit: BoxFit.fill,
      //             ),
      //           ),
      //         ),
      //       ),
      //       border: OutlineInputBorder(
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //     ),
      //   ),
      // ),