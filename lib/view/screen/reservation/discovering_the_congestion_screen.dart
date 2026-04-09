import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:test/controller/reservation/discovering_the_congestion_controller.dart';
import 'package:test/core/class/constant/appcolor.dart';
import 'package:test/view/screen/reservation/Hall_congestion_card.dart';

class DiscoveringTheCongestionScreen
    extends GetView<DiscoveringTheCongestionControllerImp> {
  const DiscoveringTheCongestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DiscoveringTheCongestionControllerImp());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// 🔹 AppBar حديث (Floating + شفاف)
          SliverAppBar(
            title: const Text(
              'اكتشاف الازدحام',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Appcolor.scondary,
          ),

          /// 🔹 Content
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                /// 🔸 Section Header (Card شكل حديث)
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'حالة القاعات',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                ),

                const SizedBox(height: 14),

                /// 🔹 Cards
                HallCongestionCard(
                  name: 'القاعة الهادئة',
                  percent: 35,
                  occupied: 18,
                  total: 30,
                  colors: const [Color(0xFF22C55E), Color(0xFF16A34A)],
                  message: 'هادئة ومناسبة للتركيز العالي',
                  onTap: () {
                    controller.gotohallquit();
                  },
                ),

                const SizedBox(height: 12),

                HallCongestionCard(
                  name: 'قاعة الاجتماعية (بدون مدخنين)',
                  percent: 68,
                  occupied: 14,
                  total: 20,
                  colors: const [Color(0xFFF59E0B), Color(0xFFD97706)],
                  message: 'ازدحام متوسط، احجز مسبقاً',
                  onTap: controller.goTOhallsmokefree,
                ),

                const SizedBox(height: 12),

                HallCongestionCard(
                  name: 'قاعة النقاش',
                  percent: 92,
                  occupied: 23,
                  total: 25,
                  colors: const [Color(0xFFEF4444), Color(0xFFDC2626)],
                  message: 'ممتلئة تقريباً، انتظر قليلاً',
                  onTap: controller.goTohallDiscussion,
                ),

                const SizedBox(height: 12),

                HallCongestionCard(
                  name: 'قاعة الاجتماعية (مدخنين)',
                  percent: 92,
                  occupied: 23,
                  total: 25,
                  colors: const [Color(0xFFEF4444), Color(0xFFDC2626)],
                  message: 'ممتلئة تقريباً، انتظر قليلاً',
                  onTap: controller.goTohallSocialForSmoker,
                ),

                const SizedBox(height: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
