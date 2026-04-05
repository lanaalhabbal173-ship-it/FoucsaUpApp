import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test/core/class/constant/routes.dart';
import 'package:test/core/class/statusrequest.dart';

abstract class SignUpController extends GetxController {
  signUP();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController Username;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late StatusRequest statusRequest;
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
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    Username = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    Username.dispose();
    super.dispose();
  }

  @override
  signUP() {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      Get.offNamed(AppRoutes.successsignup);
    } else {
      print("Not Vaild");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }
}
