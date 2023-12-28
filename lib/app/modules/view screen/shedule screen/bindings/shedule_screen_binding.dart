import 'package:get/get.dart';

import '../controllers/shedule_screen_controller.dart';

class SheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SheduleScreenController>(
      () => SheduleScreenController(),
    );
  }
}
