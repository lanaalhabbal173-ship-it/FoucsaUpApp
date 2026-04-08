import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/core/class/constant/routes.dart';
import 'package:test/core/class/statusrequest.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
  goTOForgetPassword();
  signIn();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isPasswordHidden = true;
  late StatusRequest statusRequest;
  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("Valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goTOForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }

  @override
  signIn() {
    Get.offNamed(AppRoutes.homepagescreen);
  }
}
