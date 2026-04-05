import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:test/controller/home/homepagecontroller.dart';
import 'package:test/view/widget/home/build_halls_section.dart';
import 'package:test/view/widget/home/build_package_section.dart';
import 'package:test/view/widget/home/buildaction.dart';
import 'package:test/view/widget/home/buildheader.dart';
import 'package:test/view/widget/home/nav_item.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    // final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        // notchMargin: 15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              active: controller.currentPage == 0 ? true : false,
              textbutton: "Home",
              icondata: Icons.home,
              onPressed: () {
                controller.changePage(0);
              },
            ),
            NavItem(
              active: controller.currentPage == 1 ? true : false,

              textbutton: "QR",
              icondata: Icons.qr_code_scanner_outlined,
              onPressed: () {
                controller.changePage(1);
              },
            ),
            NavItem(
              active: controller.currentPage == 2 ? true : false,
              textbutton: "profile",
              icondata: Icons.person,
              onPressed: () {
                controller.changePage(2);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Buildheader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Buildaction(),
                  const SizedBox(height: 20),
                  BuildHallsSection(),
                  const SizedBox(height: 20),
                  BuildPackageSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  //       appBar: AppBar(backgroundColor: Appcolor.scondary),
  //       drawer: Drawer(
  //         child: ListView(
  //           padding: EdgeInsets.zero,
  //           children: [
  //             DrawerHeader(
  //               decoration: BoxDecoration(color: Appcolor.scondary),
  //               child: Text(
  //                 'القائمة',
  //                 style: TextStyle(color: Colors.white, fontSize: 20),
  //               ),
  //             ),

  //             ListTile(
  //               leading: Icon(Icons.event),
  //               title: Text('فعاليات'),
  //               onTap: () {
  //                 // أكشن لما يضغط
  //               },
  //             ),

  //             ListTile(
  //               leading: Icon(Icons.task),
  //               title: Text('مهام'),
  //               onTap: () {},
  //             ),

  //             ListTile(
  //               leading: Icon(Icons.settings),
  //               title: Text('إعدادات'),
  //               onTap: () {},
  //             ),
  //           ],
  //         ),
  //       ),

  //       bottomNavigationBar: BottomNavigationBar(
  //         type: BottomNavigationBarType.fixed,
  //        // currentIndex: ,
  //         onTap: (index) {

  //         },
  //         items: const [
  //           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  //           BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Tasks"),
  //           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  //           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  //         ],
  //       ),
  //       body: Column(
  //         children: [
  //           Container(
  //             height: screenheight * .15,
  //             margin: EdgeInsets.only(bottom: 15),
  //             decoration: BoxDecoration(
  //               color: Appcolor.scondary,
  //               borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
  //             ),
  //             child: SafeArea(
  //               child: Column(
  //                 children: [
  //                   Padding(
  //                     padding: EdgeInsets.all(20),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text.rich(
  //                           TextSpan(
  //                             children: [
  //                               TextSpan(
  //                                 text: "Focus",
  //                                 style: TextStyle(
  //                                   fontSize: 26,
  //                                   fontWeight: FontWeight.w700,
  //                                   color: Colors.white,
  //                                 ),
  //                               ),
  //                               TextSpan(
  //                                 text: "Up",
  //                                 style: TextStyle(
  //                                   fontSize: 26,
  //                                   fontWeight: FontWeight.w700,
  //                                   color: Appcolor.primary,
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 20),

  //           GridView.builder(
  //             itemCount: 4,
  //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 2,
  //               childAspectRatio: 1,
  //             ),
  //             itemBuilder: (context, index) {
  //               return Container(
  //                 margin: EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   color: Colors.grey.withOpacity(0.3),
  //                   borderRadius: BorderRadius.circular(12),
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
}
