 import 'package:amin_agent/app/modules/view%20screen/completed%20shedule%20screen/controller/completed_schedule_controller.dart';
import 'package:get/get.dart';

class CompletedScheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteScheduleScreenController());
  }
}