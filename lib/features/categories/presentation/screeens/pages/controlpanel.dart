import 'package:caphore/features/categories/presentation/screeens/controlpanel/privacy_policy.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/LegalPageWidget.dart';
import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              LegalPageWidget(
                  gotopage: () {},
                  name: "الشروط والأحكام",
                  svgpath: "assets/images/justice-law-svgrepo-com.svg"),
              LegalPageWidget(
                  gotopage: () {},
                  name: "لمحة عن كافور",
                  svgpath: "assets/images/about-svgrepo-com.svg"),
              LegalPageWidget(
                  gotopage: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>const PrivacyPolicy()));},
                  name: "سياسة الخصوصية",
                  svgpath: "assets/images/shield-antivirus-svgrepo-com.svg"),
              LegalPageWidget(
                  gotopage: () {},
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
