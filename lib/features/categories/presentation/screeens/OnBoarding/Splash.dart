import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      Navigator.of(context).pushReplacementNamed("/pages");

    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              SizedBox(
                height: 500.h,
                width: 500.w,
                child:Image.asset("assets/images/TT copy.png"),
              ),
             const Spacer(),
              SizedBox(
                height: 80.h,
                child: Text(
                  "www.caphore.sy",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
