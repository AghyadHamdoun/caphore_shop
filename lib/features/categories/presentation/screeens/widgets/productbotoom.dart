import 'package:caphore/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductBottom extends StatelessWidget {
  final String price;
  final String orginalPrice;
  const ProductBottom({
    super.key,
    required this.price,
    required this.orginalPrice,
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
          Text(
            price,
            style: TextStyle(color: AppColor.primaryColor, fontSize: 20.sp),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, fixedSize: Size(250.w, 40.h)),
            onPressed: () {
              whatsapp();
            },
            icon: const Icon(Icons.call),
            label: Text(
              "اشتري الان",
              style: TextStyle(fontSize: 18.sp),
            ),
          )
        ],
      ),
    );
  }
}

whatsapp() async {
  var contact = "+963988265177";
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
