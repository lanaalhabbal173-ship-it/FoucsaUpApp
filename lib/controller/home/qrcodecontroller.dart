import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class Qrcodecontroller extends GetxController {}

class QrcodecontrollerImp extends Qrcodecontroller {
  RxString studentId = ''.obs;
  RxBool isInside = false.obs;
  RxString sessionDuration = ''.obs;
  RxString studentname = ''.obs;

  DateTime? checkInTime;
  Timer? timer;

  // عند مسح QR
  void handleQR(String id) {
    // أول دخول
    if (!isInside.value) {
      studentId.value = id;
      checkIn();
      return;
    }

    // نفس الشخص فقط يقدر يطلع
    if (studentId.value != id) {
      Get.snackbar("تنبيه", "هذا QR غير مسموح له");
      return;
    }

    // خروج
    checkOut();
  }

  // دخول
  void checkIn() {
    isInside.value = true;
    checkInTime = DateTime.now();
    startTimer();
  }

  // خروج
  void checkOut() {
    isInside.value = false;
    timer?.cancel();

    if (checkInTime != null) {
      final duration = DateTime.now().difference(checkInTime!);
      sessionDuration.value = formatDuration(duration);
    }

    checkInTime = null;
  }

  // العداد المباشر
  void startTimer() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (checkInTime != null) {
        final diff = DateTime.now().difference(checkInTime!);
        sessionDuration.value = formatDuration(diff);
      }
    });
  }

  // تنسيق الوقت
  String formatDuration(Duration d) {
    return "${d.inHours.toString().padLeft(2, '0')}:"
        "${(d.inMinutes % 60).toString().padLeft(2, '0')}:"
        "${(d.inSeconds % 60).toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
