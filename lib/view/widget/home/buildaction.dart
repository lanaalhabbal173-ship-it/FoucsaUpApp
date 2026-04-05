import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:test/view/widget/home/action_card.dart';

class Buildaction extends StatelessWidget {
  const Buildaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الخدمات',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.4,
          children: [
            ActionCard(
              label: 'حجز مقاعد',
              icon: Icons.event_seat_outlined,
              colors: const [Color(0xFF4E9BFF), Color(0xFF3B7DD8)],
              onTap: () {},
            ),
            ActionCard(
              label: 'اكتشاف الازدحام',
              icon: Icons.search_rounded,
              colors: const [Color(0xFFFF9B4E), Color(0xFFF07030)],
              onTap: () {},
            ),
            ActionCard(
              label: 'عجلة الحظ',
              icon: Icons.casino_outlined,
              colors: const [Color(0xFFA855F7), Color(0xFF7C3AED)],
              onTap: () => Get.toNamed('/wheel'),
            ),
            ActionCard(
              label: 'رمزية الدراسة',
              icon: Icons.qr_code_rounded,
              colors: const [Color(0xFF22C55E), Color(0xFF16A34A)],
              onTap: () => Get.toNamed('/qr'),
            ),
            ActionCard(
              label: 'البوفيه',
              icon: Icons.local_cafe_outlined,
              colors: const [Color(0xFF2DD4BF), Color(0xFF0D9488)],
              onTap: () => Get.toNamed('/buffet'),
            ),
            ActionCard(
              label: 'الفعاليات',
              icon: Icons.event_outlined,
              colors: const [Color(0xFFF87171), Color(0xFFDC2626)],
              onTap: () => Get.toNamed('/events'),
            ),
          ],
        ),
      ],
    );
  }
}
