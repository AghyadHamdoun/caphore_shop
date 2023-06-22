import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductBottom extends StatelessWidget {
  final String price;
  final String orginalPrice;
  final String number;
  const ProductBottom({
    super.key,
    required this.price,
    required this.orginalPrice,
    required this.number
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
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
          Row(
            children: [
              Text(
                "  السعر:   ",
                style: TextStyle(fontSize: 20.sp),
              ),
              (price == "33")
                  ? Text(
                      " تواصل لمعرفةالسعر",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )
                  : Text(
                      "$price ل.س ",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
            ],
          ),
          Row(
            children: [
              Text(
                "  المتجر:  ",
                style: TextStyle(fontSize: 20.sp),
              ),
              Text(
                "  name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, fixedSize: Size(250.w, 40.h)),
            onPressed: () {
              whatsapp(number);
            },
            icon: SvgPicture.asset(
              'assets/images/icons8-whatsapp.svg',
              height: 25.h,
              width: 20.w,
            ),
            label: Text(
              "اشتري الان",
              style: TextStyle(fontSize: 18.sp),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}

whatsapp(String number) async {
  var contact = "+$number";
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl =
      "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    EasyLoading.showError('WhatsApp is not installed.');
  }
}
