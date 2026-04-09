import 'package:flutter/material.dart';

class HallCongestionCard extends StatelessWidget {
  final String name;
  final int percent;
  final int occupied;
  final int total;
  final List<Color> colors;
  final String message;
  final void Function()? onTap;

  const HallCongestionCard({
    required this.name,
    required this.percent,
    required this.occupied,
    required this.total,
    required this.colors,
    required this.message,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: colors),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),

            Text(
              '$occupied / $total مستخدم',
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 6),

            LinearProgressIndicator(
              value: percent / 100,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation(Colors.white),
            ),

            const SizedBox(height: 6),

            Text(message, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
