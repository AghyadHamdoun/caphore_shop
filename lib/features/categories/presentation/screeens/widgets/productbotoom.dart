import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/goldenMall/bloc/golden_bloc.dart';
import 'package:caphore/features/goldenMall/bloc/golden_event.dart';
import 'package:caphore/features/goldenMall/bloc/golden_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/services/services_locator.dart';

class ProductBottom extends StatelessWidget {
  final String name;
  final String link;
  final String price;
  final String orginalPrice;
  final String number;
  final String storename;
  final String hide_wa_button;
  final Product product;

  const ProductBottom({super.key,
    required this.price,
    required this.orginalPrice,
    required this.number,
    required this.storename,
    required this.name,
    required this.link,
    required this.hide_wa_button,
  required this.product
  });
  @override
  Widget build(BuildContext context) {
    var bloc = sl<GoldenBloc>();
    return BlocConsumer<GoldenBloc, GoldenState>(
      bloc: bloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: 175.h,
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
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  (price == "33" || price == "")
                      ? Text(
                    " تواصل لمعرفةالسعر",
                    style: TextStyle(
                        color: AppColor.accentColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  )
                      : Text(
                    "$price ل.س ",
                    style: TextStyle(
                        color: AppColor.accentColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              (hide_wa_button == "yes")
                  ? const SizedBox(
                height: 0,
                width: 0,
              )
                  : (storename == "golden-mall")
                  ? ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(250.w, 40.h)),
                onPressed: () {
                  bloc.add(AddProductToBasket(productModel:product ));
                },
                icon: Icon(Icons.shopping_cart, size: 30.h),
                label: Text(
                  "اضف الى السلة",
                  style: TextStyle(fontSize: 18.sp),
                ),
              )
                  : ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(250.w, 40.h)),
                onPressed: () {
                  whatsapp(number, name, link);
                },
                icon: LottieBuilder.asset(
                  "assets/lottie/animation_ljzsiq8i.json",
                  height: 35.h,
                  width: 35.w,
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
      },
    );
  }
}

whatsapp(String number, String name, String link) async {
  var contact = "+$number";
  var androidUrl =
      "whatsapp://send?phone=$contact&text=مرحبا اريد الطلب\n $name الرابط:   $link\n شكرا لك!";
  var iosUrl =
      "https://wa.me/$contact?text= =مرحبا اريد الطلب\n $name الرابط:   $link\n شكرا لك!${Uri
      .parse('')}";
  final Uri url = Uri(scheme: 'tel', path: contact);
  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    EasyLoading.showError('WhatsApp is not installed.');
    try {
      await launchUrl(url);
    } on Exception {
      EasyLoading.showError("can't launch ");
    }
  }
}
