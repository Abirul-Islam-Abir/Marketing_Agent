import 'package:get/get.dart';

import '../controllers/shedule_screen_controller.dart';

class ScheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleScreenController>(
      () => ScheduleScreenController(),
    );
  }
}
