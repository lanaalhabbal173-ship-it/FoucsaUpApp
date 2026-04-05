import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test/controller/auth/logincontroller.dart';
import 'package:test/core/class/constant/appcolor.dart';
import 'package:test/core/function/alertexitapp.dart';
import 'package:test/core/function/validinput.dart';
import 'package:test/view/widget/auth/buildlogoscreen.dart';
import 'package:test/view/widget/auth/custombuttonauth.dart';
import 'package:test/view/widget/auth/customtextformauth.dart';
import 'package:test/view/widget/auth/textsignup.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(toolbarHeight: 30.0, backgroundColor: Appcolor.scondary),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),

          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                SizedBox(height: 20),
                Buildlogoscreen(),
                SizedBox(height: 30),

                Customtextformauth(
                  valid: (val) {
                    return validInput(val!, 5, 50, "email");
                  },
                  isNumber: false,
                  mycontroller: controller.email,
                  hinttext: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  labeltext: "Email",
                  // mycontroller: ,
                ),

                GetBuilder<LoginControllerImp>(
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
                InkWell(
                  onTap: () {
                    controller.goTOForgetPassword();
                  },
                  child: Text(
                    "Forget Password ?",
                    style: TextStyle(
                      color: Appcolor.scondary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
                Custombuttonauth(
                  onPressed: () {
                    controller.signIn();
                  },
                  text: "Sign In",
                ),
                SizedBox(height: 30),
                Textsignup(
                  textone: "Don't have an account ?",
                  texttwo: "SignUP",
                  onTap: () {
                    controller.goToSignup();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
