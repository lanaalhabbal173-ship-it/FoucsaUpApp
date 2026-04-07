import 'package:flutter/material.dart';
import 'package:test/core/class/constant/appcolor.dart';
import 'package:test/view/widget/typeofbooking/buildbookingcard.dart';

class TypebookingScreen extends StatelessWidget {
  const TypebookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              floating: false,
              pinned: false,
              snap: false,
              expandedHeight: 70,
              automaticallyImplyLeading: true,
            ),

            SliverToBoxAdapter(
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Buildbookingcard(
                      color: Appcolor.scondary,
                      icon: Icons.meeting_room,
                      text: "حجز قاعة",
                      text2: "مثالية للاجتماعات، ورش العمل،",
                      text3: "أختيار القاعة",
                      backgroundColor: Appcolor.scondary,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                    Buildbookingcard(
                      icon: Icons.event_seat_outlined,
                      color: const Color(0xff2E7D32),
                      text: "حجز طاولة",
                      text2: ".بيئة هادئة مصممة لزيادة تركيز او الأنجاز الفردي",
                      text3: "أختيار الطاولة",
                      backgroundColor: const Color(0xff2E7D32),
                      onPressed: () {},
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
