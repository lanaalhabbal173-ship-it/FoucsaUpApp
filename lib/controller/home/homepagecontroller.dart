import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/core/class/constant/routes.dart';

abstract class HomePageController extends GetxController {
  goToQrCode();
  goToTypeBooking();
  goToLuckyWheel();
  changePage(int currentpage);
}

class HomePageControllerImp extends HomePageController {
  var selectedindex = 0.obs;
  @override
  changePage(int i) {
    selectedindex.value = i;
    update();
  }

  @override
  goToQrCode() {
    Get.toNamed(AppRoutes.qrcodescreen);
  }

  @override
  goToTypeBooking() {
    Get.toNamed(AppRoutes.typebookingscreen);
  }

  @override
  goToLuckyWheel() {
    Get.toNamed(AppRoutes.luckywheelscreen);
  }
}
