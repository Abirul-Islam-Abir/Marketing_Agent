import 'package:get/get.dart';

import '../controllers/doctor_onboard_screen_controller.dart';

class DoctorOnboardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorOnboardScreenController>(
      () => DoctorOnboardScreenController(),
    );
  }
}
