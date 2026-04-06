import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:test/controller/home/qrcodecontroller.dart';
import 'package:test/core/class/constant/appcolor.dart';

class QrcodeScreen extends StatelessWidget {
  const QrcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QrcodecontrollerImp controller = Get.put(QrcodecontrollerImp());
    return Scaffold(
      backgroundColor: const Color(0xFF1A3A5C),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'رمز الدخول',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
          onPressed: () => Get.back(),
        ),
      ),

      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // QR
              Obx(
                () => QrImageView(
                  data: controller.studentId.value,
                  version: QrVersions.auto,
                  size: 200,
                  foregroundColor: const Color(0xFF1A3A5C),
                ),
              ),

              const SizedBox(height: 16),

              // الاسم
              Obx(
                () => Text(
                  controller.studentname.value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A3A5C),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // الحالة
              Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: controller.isInside.value
                        ? const Color.fromARGB(255, 57, 174, 126)
                        : const Color(0xFFF1EFE8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: controller.isInside.value
                              ? const Color(0xFF1D9E75)
                              : const Color(0xFF888780),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        controller.isInside.value
                            ? 'داخل المركز'
                            : 'خارج المركز',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: controller.isInside.value
                              ? const Color(0xFF0F6E56)
                              : const Color(0xFF888780),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Obx(
                () => controller.sessionDuration.value.isNotEmpty
                    ? Text(
                        'مدة الجلسة: ${controller.sessionDuration.value}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Appcolor.black,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          'اعرض هذا الرمز لموظف الاستقبال\nعند الدخول والخروج',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.7),
        ),
      ),
    );
  }
}
