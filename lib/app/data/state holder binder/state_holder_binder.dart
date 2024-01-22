

import 'package:amin_agent/app/modules/auth%20screen/password%20reset%20screen/controllers/password_set_screen_controller.dart';
import 'package:amin_agent/app/modules/connectivity/controller/internet_connectivity.dart';

import '../const/export.dart';

class StateHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => OtpVerifyScreenController());
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => ScheduleScreenController());
    Get.lazyPut(() => NotificationScreenController());
    Get.lazyPut(() => GreetingsScreenController());
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => DashboardScreenController());
    Get.lazyPut(() => TotalCommissionScreenController());
    Get.lazyPut(() => TotalSalesScreeenController());
    Get.lazyPut(() => NetworkController());
    Get.lazyPut(() => ForgetPasswordScreenController());
    Get.lazyPut(() => PasswordSetScreenController());
  }
}
