import 'package:get/get.dart';

import '../controller/target_wise_doctor_visited_controller.dart';

class TargetWiseDoctorVisitedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TargetWiseDoctorVisitedController());
  }
}