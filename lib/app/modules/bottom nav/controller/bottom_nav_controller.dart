import 'package:get/get.dart';

import '../../../data/const/export.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  void selectIndex(index) {
    selectedIndex = index;
    update();
  }


}
