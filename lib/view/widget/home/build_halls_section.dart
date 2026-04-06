import 'package:flutter/material.dart';
import 'package:test/view/widget/home/Hall_congestion_card.dart';

class BuildHallsSection extends StatelessWidget {
  const BuildHallsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'حالة القاعات',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'عرض الكل',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        HallCongestionCard(
          name: 'القاعة الهادئة',
          percent: 35,
          occupied: 18,
          total: 30,
          colors: const [Color(0xFF22C55E), Color(0xFF16A34A)],
          message: 'هادئة ومناسبة للتركيز العالي',
        ),
        HallCongestionCard(
          name: 'القاعة الاجتماعية',
          percent: 68,
          occupied: 14,
          total: 20,
          colors: const [Color(0xFFF59E0B), Color(0xFFD97706)],
          message: 'ازدحام متوسط، احجز مسبقاً',
        ),
        HallCongestionCard(
          name: "القاعة الاجتماعية",
          percent: 68,
          occupied: 14,
          total: 20,
          colors: const [Color(0xFFF59E0B), Color(0xFFD97706)],
          message: 'ازدحام متوسط، احجز مسبقاً',
        ),

        HallCongestionCard(
          name: 'قاعة النقاش',
          percent: 92,
          occupied: 23,
          total: 25,
          colors: const [Color(0xFFEF4444), Color(0xFFDC2626)],
          message: 'ممتلئة تقريباً، انتظر قليلاً',
        ),
      ],
    );
  }
}
