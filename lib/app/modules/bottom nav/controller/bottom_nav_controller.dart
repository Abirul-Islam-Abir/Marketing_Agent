
import '../../../data/const/export.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void selectIndex(index) {
    if (Get.find<ProfileScreenController>().userProfileList.isNotEmpty) {
      if(selectedIndex != 1){
        Get.find<ScheduleScreenController>().initializeMethod(joinedDates);
        selectedIndex = index;
        update();
      }
      selectedIndex = index;
      update();
    }
  }
}