import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test/controller/auth/resetpasswordcontroller.dart';
import 'package:test/core/class/constant/appcolor.dart';
import 'package:test/core/function/validinput.dart';
import 'package:test/view/widget/auth/buildicon.dart';
import 'package:test/view/widget/auth/custombodytitle.dart';
import 'package:test/view/widget/auth/custombuttonauth.dart';
import 'package:test/view/widget/auth/customtextformauth.dart';
import 'package:test/view/widget/auth/customtexttitleauth.dart';

class Resetpasswordscreen extends StatelessWidget {
  const Resetpasswordscreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResetpasswordcontrollerImp controller = Get.put(
      ResetpasswordcontrollerImp(),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: BackButton(color: Colors.amber),
        toolbarHeight: 40.0,
        backgroundColor: Appcolor.scondary,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: GetBuilder<ResetpasswordcontrollerImp>(
            builder: (controller) => ListView(
              children: [
                SizedBox(height: 30),
                Buildicon(iconData: Icons.lock_open_outlined),
                Customtexttitleauth(text: "Change Password"),
                Custombodytitle(text: "Forget your Password Change it "),

                SizedBox(height: 50),

                Customtextformauth(
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

                Customtextformauth(
                  valid: (val) {
                    return validInput(val!, 8, 15, " Confirm password");
                  },
                  isNumber: false,
                  onTapIcon: () {
                    controller.showPassword();
                    controller.tooglePasswoed();
                  },
                  obscureText: controller.isshowPassword,
                  mycontroller: controller.password,
                  hinttext: "Confirm Password",
                  iconData: controller.isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility,
                  labeltext: "Confirm password",
                ),
                Custombuttonauth(
                  onPressed: () {
                    controller.goToSuccessResetPassword();
                  },
                  text: "Save",
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
