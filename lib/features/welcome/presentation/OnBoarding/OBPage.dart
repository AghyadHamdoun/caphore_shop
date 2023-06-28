import 'package:caphore/core/utils/prefrences.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/on_boarding_one.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/on_boarding_three.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/on_boarding_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../../../core/utils/app_color.dart';

class OBPage extends StatefulWidget {
  OBPage({Key? key}) : super(key: key);

  @override
  State<OBPage> createState() => _OBPageState();
}

class _OBPageState extends State<OBPage> {
  final controller = LiquidController();

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const OnBoardingOne(
          image: "assets/images/1R.png",
          text1: "اختر ما تريد!",
          text2:
              "يحتوي كافور مول الكثير من المنتجات\nالمميزة والأنيقةالتي يحتاجها الجميع"),
      const OnBoardingTwo(
          image: "assets/images/2R.png",
          text1: "سهولة الطلب",
          text2:
              "اطلب ما تريدعن طريق الواتس اب\nوالتواصل مع صاحب المتجر مباشرة"),
      const OnBoardingTree(
          image: "assets/images/3R.png",
          text1: "استلم طلبك",
          text2: "بعد طلب المنتج المراد يتم توصيله اليك\nبكل سهولة وسرعة"),
    ];

    return Scaffold(
      backgroundColor: (controller.currentPage == 1)
          ? Color.fromARGB(225, 213, 227, 254)
          : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: LiquidSwipe(
              initialPage: 0,
              enableLoop: false,
              liquidController: controller,
              onPageChangeCallback: onPageChangeCallback,
              pages: pages,
              enableSideReveal: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor.withOpacity(1),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                page1a2a3(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                child: Text(
                  "   التالي   ",
                  style: TextStyle(fontSize: 20.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    currentpage = activePageIndex;
    setState(() {});
  }

  void page1a2a3(BuildContext context) {
    if (controller.currentPage != 2) {
      int nextpage = controller.currentPage + 1;
      controller.animateToPage(
        page: nextpage,
      );
    } else {
      Preferences.saveIsFirstTime(false);
      Navigator.of(context).pushReplacementNamed("/pages");
    }
  }
}
