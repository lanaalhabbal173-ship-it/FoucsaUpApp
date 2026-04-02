import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test/controller/auth/signupcontroller.dart';
import 'package:test/core/class/constant/appcolor.dart';
import 'package:test/core/function/alertexitapp.dart';
import 'package:test/core/function/validinput.dart';
import 'package:test/view/widget/auth/custombuttonauth.dart';
import 'package:test/view/widget/auth/customtextformauth.dart';
import 'package:test/view/widget/auth/textfocusup.dart';
import 'package:test/view/widget/auth/textsignup.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Account", style: TextStyle(color: Colors.white)),
        toolbarHeight: 40.0,
        backgroundColor: Appcolor.scondary,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  SizedBox(height: 20),

                  Center(child: Textfocusup()),
                  SizedBox(height: 30),
                  Customtextformauth(
                    valid: (val) {
                      return validInput(val!, 4, 10, "username");
                    },
                    isNumber: false,
                    mycontroller: controller.Username,
                    hinttext: "Enter Your Username",
                    iconData: Icons.person_outlined,
                    labeltext: "Username",
                  ),
                  Customtextformauth(
                    valid: (val) {
                      return validInput(val!, 5, 50, "email");
                    },
                    isNumber: false,
                    mycontroller: controller.email,

                    hinttext: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                  ),
                  Customtextformauth(
                    valid: (val) {
                      return validInput(val!, 5, 10, "phone");
                    },
                    mycontroller: controller.phone,
                    isNumber: true,
                    hinttext: "Enter Your Phone",
                    iconData: Icons.phone_android_outlined,
                    labeltext: "Phone",
                  ),
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) => Customtextformauth(
                      valid: (val) {
                        return validInput(val!, 8, 15, "password");
                      },
                      onTapIcon: () {
                        controller.showPassword();
                        controller.tooglePasswoed();
                      },
                      obscureText: controller.isshowPassword,
                      isNumber: false,
                      mycontroller: controller.password,
                      hinttext: "Enter Your password",
                      iconData: controller.isHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      labeltext: "password",
                    ),
                  ),
                  Custombuttonauth(
                    onPressed: () {
                      controller.signUP();
                    },
                    text: "Sign Up",
                  ),
                  SizedBox(height: 25),
                  Textsignup(
                    onTap: () {
                      controller.goToSignIn();
                    },
                    textone: " have an account ?",
                    texttwo: "Sign In",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
