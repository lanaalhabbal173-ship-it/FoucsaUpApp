import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/core/class/constant/routes.dart';

abstract class Resetpasswordcontroller extends GetxController {
  goToSuccessResetPassword();
}

class ResetpasswordcontrollerImp extends Resetpasswordcontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController ConfirmPassword;
  bool isshowPassword = true;
  bool isHidden = true;
  showPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  tooglePasswoed() {
    isHidden = !isHidden;
    update();
  }

  @override
  void onInit() {
    password = TextEditingController();
    ConfirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    ConfirmPassword.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToSuccessResetPassword() {
    Get.offAllNamed(AppRoutes.successresetpassword);
  }
}
