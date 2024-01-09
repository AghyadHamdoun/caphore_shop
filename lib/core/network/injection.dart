import 'package:caphore/core/network/neworkcontrol.dart';
import 'package:get/get.dart';

class injection {
  static void init() {
    Get.put<networkcontrol>(networkcontrol(), permanent: true);
  }
}
