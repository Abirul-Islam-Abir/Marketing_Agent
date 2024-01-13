import 'package:get/get.dart';

import '../controllers/doctor_visited_screen_controller.dart';

class DoctorVisitedScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorVisitedScreenController>(
      () => DoctorVisitedScreenController(),
    );
  }
}
