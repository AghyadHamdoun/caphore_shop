import 'dart:async';

import 'package:caphore/core/utils/prefrences.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/OBPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int _remainingTime = 2;
  late Timer _timer;

  @override
  void initState() {

   _timer =  Timer.periodic(const Duration(seconds: 1), (timer) {
     if (_remainingTime==0) {
       bool? isFirst=Preferences.getIsFirstTime();
       if(isFirst == true)
       {
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) =>  OBPage()),
         );
       }
       else{
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => const MyPages()),
         );
       }
     }
     else {
       _remainingTime--;
     }


    });

   super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
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
                child: Image.asset("assets/images/TT copy.png"),
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
