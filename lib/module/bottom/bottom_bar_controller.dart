import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  onItemTapped(RxInt index) {
    selectedIndex = index;
  }
}
