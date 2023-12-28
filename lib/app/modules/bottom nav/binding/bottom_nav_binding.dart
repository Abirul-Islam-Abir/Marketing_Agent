import 'package:amin_agent/app/modules/bottom%20nav/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavController());
  }
}