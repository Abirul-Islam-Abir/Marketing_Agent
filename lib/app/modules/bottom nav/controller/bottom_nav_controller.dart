import '../../../data/const/export.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void selectIndex(index) {
    if (Get.find<ProfileScreenController>().userProfileList.isNotEmpty) {
      selectedIndex = index;
      update();
    }
  }
}