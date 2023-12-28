import 'package:amin_agent/app/modules/auth%20screen/login%20screen/controllers/login_screen_controller.dart';
import 'package:amin_agent/app/modules/view%20screen/profile%20screen/controllers/profile_screen_controller.dart';
import 'package:get/get.dart';

import '../../modules/bottom nav/binding/bottom_nav_binding.dart';
import '../../modules/view screen/greetings_screen/controllers/greetings_screen_controller.dart';
import '../../modules/view screen/notification_screen/controllers/notification_screen_controller.dart';
import '../../modules/view screen/shedule screen/controllers/shedule_screen_controller.dart';

class StateHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => SheduleScreenController());
    Get.lazyPut(() => NotificationScreenController());
    Get.lazyPut(() => GreetingsScreenController());
    Get.lazyPut(() => BottomNavBinding());
  }
}