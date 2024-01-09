import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/goldenMall/bloc/golden_bloc.dart';
import 'package:caphore/features/goldenMall/bloc/golden_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'bloc/golden_state.dart';

class MallProductBottom extends StatelessWidget {
  List<Product> products;
  final String name;
  final String link;
  final String price;
  final String orginalPrice;
  final String number;
  final String storename;
  final String hide_wa_button;
  MallProductBottom(
      {super.key,
      required this.products,
      required this.price,
      required this.orginalPrice,
      required this.number,
      required this.storename,
      required this.name,
      required this.link,
      required this.hide_wa_button});

  @override
  Widget build(BuildContext context) {
    var bloc = sl<GoldenBloc>();
    int sum = 0;
    return BlocConsumer<GoldenBloc, GoldenState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (BuildContext context, GoldenState state) {
        products = state.basketProducts;
        for (var i = 0; i < state.basketProducts.length; i++) {
          sum += state.basketProducts[i].total;
        }
        String text = "";
        generatetext() {
          for (var i = 0; i < state.basketProducts.length; i++) {
            text += "  \n";
            text += state.basketProducts[i].name;
            text += "  \n";
            text += "الكمية:   ${state.basketProducts[i].amount} ";
            text += "  \n";
            text += "السعر :   ${state.basketProducts[i].price} ";
          }
          text += "  \n";
          text += " المجموع:   $sum ";
        }

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
              Text(
                "اجمالي سلة المشتريات",
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              Row(
                children: [
                  Text(
                    "  المجموع:   ",
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  ),
                  (sum == 33 || sum == 0)
                      ? Text(
                          " تواصل لمعرفةالسعر",
                          style: TextStyle(
                              color: AppColor.accentColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold),
                        )
                      : Text(
                          "$sum ل.س ",
                          style: TextStyle(
                              color: AppColor.accentColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold),
                        ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              (hide_wa_button == "yes")
                  ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: Size(250.w, 40.h)),
                      onPressed: () {
                        generatetext();
                        whatsapp(number, sum, text,bloc);
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

whatsapp(String number, int sum, String text,GoldenBloc bloc) async {
  var contact = "+$number";

  var androidUrl =
      "whatsapp://send?phone=$contact&text=مرحبا اريد الطلب\n $text\n شكرا لك!";
  var iosUrl =
      "https://wa.me/$contact?text= =مرحبا اريد الطلب\n $text\n شكرا لك!${Uri.parse('')}";
  final Uri url = Uri(scheme: 'tel', path: contact);
  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
    // bloc.add(MakeBasketEmpty());
  } on Exception {
    EasyLoading.showError('WhatsApp is not installed.');
    try {
      await launchUrl(url);
    } on Exception {
      EasyLoading.showError("can't launch ");
    }
  }
}
