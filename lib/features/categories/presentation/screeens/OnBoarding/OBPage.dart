import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/OBwidgets/OBwidget2.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/OBwidgets/OBwidget3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'OBwidgets/OBwidget1.dart';

class OBPage extends StatelessWidget {
  const OBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pages = [OBwidget1(), OBwidget2(), OBwidget3()];
    final controller = LiquidController();
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 30.h,
            right: 170.w,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Colors.black,
                dotHeight: 5.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
