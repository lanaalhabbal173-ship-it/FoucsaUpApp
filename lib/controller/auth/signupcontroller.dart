import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test/core/class/constant/routes.dart';
import 'package:test/core/class/constant/storagehandler.dart';
import 'package:test/core/class/crud.dart';
import 'package:test/core/class/statusrequest.dart';
import 'package:test/core/function/handlingdatacontroller.dart';
import 'package:test/model/datasource/auth/signup_data.dart';

abstract class SignUpController extends GetxController {
  signUP();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  SignupData signupData = SignupData(Crud());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  List data = [];
  late TextEditingController fullname;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController password_confirmation;

  late StatusRequest statusRequest;

  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  void togglePassword() {
    isPasswordHidden = !isPasswordHidden;
    update();
  }

  void toggleConfirmPassword() {
    isConfirmHidden = !isConfirmHidden;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    fullname = TextEditingController();
    password_confirmation = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    phone.dispose();
    fullname.dispose();
    password_confirmation.dispose();
    super.dispose();
  }

  @override
  signUP() async {
    if (password.text != password_confirmation.text)
      return Get.defaultDialog(
        title: "warning",
        middleText: "password Not Match",
      );
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await signupData.postData(
        fullname.text,
        phone.text,
        email.text,
        password.text,
        password_confirmation.text,
      );

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          // إذا السيرفر يرجع token
          if (response["token"] != null) {
            StorageHandler().setToken(response["token"]);
          }

          Get.offNamed(AppRoutes.successsignup);
        } else {
          Get.defaultDialog(
            title: "Error",
            middleText: response["message"] ?? "Signup failed",
          );
        }
      } else {
        Get.defaultDialog(
          title: "Error",
          middleText: "Check internet / server",
        );
      }

      update();
    }
  }

  // signUP() async {
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     var response = await signupData.postData(
  //       fullname.text,
  //       phone.text,
  //       email.text,
  //       password.text,
  //       forgetpassword.text,
  //     );
  //     statusRequest = handlingData(response);
  //     if (statusRequest == StatusRequest.success) {
  //       if (response['status'] == "success") {
  //         Get.offNamed(AppRoutes.successsignup);
  //       } else {
  //         Get.defaultDialog(
  //           title: "Sign Up Failed",
  //           middleText:
  //               response['message'] ?? "An error occurred during sign up.",
  //           textConfirm: "OK",
  //           onConfirm: () => Get.back(),
  //         );
  //       }
  //     } else {
  //       Get.defaultDialog(
  //         title: "Error",
  //         middleText: "Failed to sign up. Please try again later.",
  //         textConfirm: "OK",
  //         onConfirm: () => Get.back(),
  //       );
  //     }

  //     update();

  //     //  Get.offNamed(AppRoutes.successsignup);
  //   } else {
  //     print("Not Vaild");
  //   }
  // }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }
}
