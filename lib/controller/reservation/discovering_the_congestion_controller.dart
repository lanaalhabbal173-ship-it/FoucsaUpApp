import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/core/class/constant/routes.dart';

abstract class DiscoveringTheCongestionController extends GetxController {
  gotohallquit();
  goTohallDiscussion();
  goTOhallsmokefree();
  goTohallSocialForSmoker();
}

class DiscoveringTheCongestionControllerImp
    extends DiscoveringTheCongestionController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  gotohallquit() {
    Get.toNamed(AppRoutes.hallquietscreen);
  }

  @override
  goTohallDiscussion() {
    Get.toNamed(AppRoutes.halldiscussionscreen);
  }

  @override
  goTOhallsmokefree() {
    Get.toNamed(AppRoutes.hallsmokefreescreen);
  }

  @override
  goTohallSocialForSmoker() {
    Get.toNamed(AppRoutes.hallsocialforsmokerscreen);
  }
}
