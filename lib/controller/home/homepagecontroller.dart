import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class HomePageController extends GetxController {
  changePage(int currentpage);
}

class HomePageControllerImp extends HomePageController {
  int currentPage = 0;
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
