import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_color.dart';

class OnBoardingTwo extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  const OnBoardingTwo(
      {Key? key, required this.image, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          color: const Color.fromARGB(225, 213, 227, 254),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  height:size.height/1.5,
                  image,
                  fit: BoxFit.cover,
                ),
                Text(
                  text1,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  text2,
                  style: TextStyle(fontSize: 18.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 106, 117, 141),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 106, 117, 141),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
