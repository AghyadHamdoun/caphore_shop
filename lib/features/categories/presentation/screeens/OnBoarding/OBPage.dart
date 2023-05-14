import 'package:caphore/features/categories/presentation/screeens/widgets/OBwidget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OBPage extends StatelessWidget {
  OBPage({Key? key}) : super(key: key);

  final controller = LiquidController();
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      OBwidget(
        image: "assets/images/1R.png",
        text1: "text1",
        text2: "text2",
      ),
      OBwidget(
        image: "assets/images/2R.png",
        text1: "text1",
        text2: "text2",
      ),
      OBwidget(
        image: "assets/images/3R.png",
        text1: "text1",
        text2: "text2",
      ),
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
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    currentpage = activePageIndex;
  }

  page1a2f() {
    int nextpage = controller.currentPage + 1;
    controller.animateToPage(page: nextpage);
  }
}
