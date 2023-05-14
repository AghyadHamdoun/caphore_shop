import 'package:caphore/features/categories/presentation/screeens/widgets/LegalPageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_color.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LegalPageWidget(
                  name: "الشروط والأحكام",
                  svgpath: "assets/images/justice-law-svgrepo-com.svg"),
              LegalPageWidget(
                  name: "لمحة عن كافور",
                  svgpath: "assets/images/about-svgrepo-com.svg"),
              LegalPageWidget(
                  name: "سياسة الخصوصية",
                  svgpath: "assets/images/shield-antivirus-svgrepo-com.svg"),
              LegalPageWidget(
                  name: " تواصل معنا",
                  svgpath:
                      "assets/images/headphones-microphone-svgrepo-com.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
