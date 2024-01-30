import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/controller/completed_schedule_controller.dart';
import 'package:get/get.dart';

class CompletedScheduleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompleteScheduleScreenController());
  }
}