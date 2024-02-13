import 'dart:async';
import 'package:caphore/core/error/exceptions.dart';
import 'package:caphore/core/network/api_constance.dart';
import 'package:caphore/core/network/error_message_model.dart';
import 'package:caphore/core/utils/prefrences.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/OBPage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_redirect/store_redirect.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool? isFirst = Preferences.getIsFirstTime();
  final connectivity = Connectivity();
  String virsion = "1";
  bool internet = true;
  String url = "";
  String url2 = "";
  String name = "";
  Future getProductDetails(int id) async {
    final response = await Dio().get(ApiConstance.oneProductsPath(id));
    if (response.statusCode == 200) {
      print(response.data);
      name = response.data["name"];
      url = response.data["short_description"];
      url2 = response.data["description"];
      print("==================");
      print(name);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  Future<ConnectivityResult> net() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      internet = true;
      await getProductDetails(61701);
    } else {
      internet = false;
    }
    return connectivityResult;
  }

  @override
  void initState() {
    net().then(
      (value) => Future.delayed(
        const Duration(seconds: 2),
        () {
          if (value == ConnectivityResult.none || name == virsion) {
            if (isFirst == true) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => OBPage()),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyPages()),
              );
            }
          } else if (internet == true && name != virsion) {
            Get.defaultDialog(
              title: "التطبيق بحاجة الى تحديث",
              middleText: "الرجاء تحديث التطبيق للتمتع بتجربة تسوق افضل",
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: Size(100.w, 40.h)),
                  onPressed: () {
                    StoreRedirect.redirect(
                      androidAppId: url,
                      iOSAppId: url2,
                    );
                  },
                  child: Text(
                    "تحديث",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      fixedSize: Size(100.w, 40.h)),
                  onPressed: () {
                    if (isFirst == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OBPage()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyPages()),
                      );
                    }
                  },
                  child: Text(
                    "تخطي",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/images/15.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

//  Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 100.h,
//               ),
//               SizedBox(
//                 height: 500.h,
//                 width: 500.w,
//                 child: Image.asset("assets/images/TT copy.png"),
//               ),
//               const Spacer(),
//               SizedBox(
//                 height: 80.h,
//                 child: Text(
//                   "www.caphore.sy",
//                   style:
//                       TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
 