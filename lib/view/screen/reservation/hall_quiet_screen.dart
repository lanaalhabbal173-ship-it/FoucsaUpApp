import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test/controller/reservation/hall_quiet_controller.dart';

class HallQuietScreen extends GetView<HallQuietControllerImp> {
  const HallQuietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HallQuietControllerImp());
    return Scaffold(
     
    
  );
}
