import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class networkcontrol extends GetxController {
  final connectivity = Connectivity();

  @override
  void onInit() async {
    super.onInit();
    connectivity.onConnectivityChanged.listen(onConnectivityupdate);
  }

  void onConnectivityupdate(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          "الرجاء الاتصال بالانترنت",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        isDismissible: false,
        duration: const Duration(days: 1),
        icon: const Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 35,
        ),
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
        if (connectivityResult == ConnectivityResult.mobile ||
            connectivityResult == ConnectivityResult.wifi) {
          Get.rawSnackbar(
            messageText: const Text(
              "تم استعادة الاتصال بالانترنت",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: Colors.green,
            isDismissible: false,
            duration: const Duration(seconds: 2),
            icon: const Icon(
              Icons.wifi_off,
              color: Colors.white,
              size: 35,
            ),
          );
        }
      }
    }
  }
}
