import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/core/services/services.dart';
import 'package:test/localization/transliation.dart';
import 'package:test/view/screen/auth/forgetpassword/forgetpasswordscreen.dart';
import 'package:test/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:test/view/screen/auth/loginscreen.dart';
import 'package:test/view/screen/auth/forgetpassword/resetpasswordscreen.dart';
import 'package:test/view/screen/auth/signupscreen.dart';
import 'package:test/view/screen/auth/splashscreen.dart';
import 'package:test/view/screen/auth/success_signup.dart';
import 'package:test/view/screen/home/homepage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Splashscreen()),
        GetPage(name: "/login", page: () => Loginscreen()),
        GetPage(name: "/signup", page: () => Signupscreen()),
        GetPage(name: "/forgetpassword", page: () => Forgetpasswordscreen()),
        GetPage(name: "/resetpassword", page: () => Resetpasswordscreen()),
        GetPage(name: "/successignup", page: () => SuccessSignup()),
        GetPage(
          name: "/succesresetpassword",
          page: () => Successresetpassword(),
        ),
        GetPage(name: "/homepagescreen", page: () => HomepageScreen()),
      ],
    );
  }
}
