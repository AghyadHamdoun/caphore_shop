import 'package:caphore/features/categories/presentation/screeens/controlpanel/privacy_policy.dart';
import 'package:caphore/features/categories/presentation/screeens/controlpanel/terms_and_conditions.dart';
import 'package:caphore/features/categories/presentation/screeens/controlpanel/who_is_we.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/LegalPageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../controlpanel/contact_us.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset('assets/lottie/controlpanel.json',
                  fit: BoxFit.cover, height: 250.h),
              SizedBox(height: 10.h,),
              LegalPageWidget(
                  gotopage: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsAndConditions()));
                  },
                  name: "الشروط والأحكام",
                  svgpath: "assets/images/justice-law-svgrepo-com.svg"),
              LegalPageWidget(
                  gotopage: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const WhoIsWe()));
                  },
                  name: "لمحة عن كافور",
                  svgpath: "assets/images/about-svgrepo-com.svg"),
              LegalPageWidget(
                  gotopage: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicy()));
                  },
                  name: "سياسة الخصوصية",
                  svgpath: "assets/images/shield-antivirus-svgrepo-com.svg"),
              LegalPageWidget(
                  gotopage: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUs()));
                  },
                  name: " تواصل معنا",
                  svgpath: "assets/images/headphones-microphone-svgrepo-com.svg"),
            ],
          ),
        ),
      ),
    );
  }
}
