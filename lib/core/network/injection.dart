import 'package:caphore/core/network/neworkcontrol.dart';
import 'package:get/get.dart';

class Injection {
  static void init() {
    Get.put<Networkcontrol>(Networkcontrol(), permanent: true);
  }
}
