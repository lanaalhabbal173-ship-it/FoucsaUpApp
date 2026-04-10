import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/core/class/constant/routes.dart';
import 'package:test/core/class/constant/storagehandler.dart';
import 'package:test/core/class/crud.dart';
import 'package:test/core/class/statusrequest.dart';
import 'package:test/model/datasource/auth/login_data.dart';
import 'package:test/model/static/auth_model.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignup();
  goTOForgetPassword();
  signIn();
}

class LoginControllerImp extends LoginController {
  final LoginData loginData = LoginData(Crud());
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
  signIn() async {
    if (!formstate.currentState!.validate()) return;

    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await loginData.postData({
        "email": email.text,
        "password": password.text,
      });

      print("🔵 LOGIN RESPONSE => $response");

      if (response != null && response["token"] != null) {
        final auth = AuthModel.fromJson(response);

        statusRequest = StatusRequest.success;
        update();

        StorageHandler().setToken(auth.token);

        Get.offAllNamed(AppRoutes.homepagescreen);
      } else {
        statusRequest = StatusRequest.failure;
        update();

        Get.defaultDialog(
          title: "Error",
          middleText: response?["message"] ?? "Login failed",
        );
      }
    } catch (e) {
      print("❌ EXCEPTION => $e");

      statusRequest = StatusRequest.failure;
      update();
    }

    statusRequest = StatusRequest.none;
    update();
  }
}
