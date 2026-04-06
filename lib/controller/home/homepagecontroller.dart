import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/core/class/constant/routes.dart';

abstract class HomePageController extends GetxController {
  goToQrCode();

  changePage(int currentpage);
}

class HomePageControllerImp extends HomePageController {
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }

  @override
  goToQrCode() {
    Get.toNamed(AppRoutes.qrcodescreen);
  }
}
