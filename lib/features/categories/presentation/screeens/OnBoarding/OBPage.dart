import 'package:caphore/features/categories/presentation/screeens/OnBoarding/on_boarding_one.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/on_boarding_three.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/on_boarding_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../../../../../core/utils/app_color.dart';

class OBPage extends StatelessWidget {
  OBPage({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          LiquidSwipe(
            initialPage: 0,
            enableLoop: false,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallback,
            pages: pages,
            enableSideReveal: false,
          ),
          Positioned(
            bottom: 60.h,
            left: 130.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor.withOpacity(1),
                shape: const StadiumBorder(),
                fixedSize: Size(130.w, 45.h),
              ),
              onPressed: () {
                page1a2a3(context);
              },
              child: Text(
                "   التالي   ",
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    currentpage = activePageIndex;
  }

  void page1a2a3(BuildContext context) {
    if (controller.currentPage != 2) {
      int nextpage = controller.currentPage + 1;
      controller.animateToPage(
        page: nextpage,
      );
    } else {
      Navigator.of(context).pushReplacementNamed("/pages");
    }
  }
}
