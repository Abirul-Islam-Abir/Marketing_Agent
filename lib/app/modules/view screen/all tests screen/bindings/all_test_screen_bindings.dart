import 'package:amin_agent/app/modules/view%20screen/all%20tests%20screen/controller/all_test_screen_controller.dart';
import 'package:get/get.dart';

class AllTestScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AllTestScreenController());
  }
}