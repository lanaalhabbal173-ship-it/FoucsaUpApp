import 'package:get/get.dart';
import 'package:test/core/class/crud.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
