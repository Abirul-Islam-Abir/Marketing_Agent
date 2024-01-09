
import 'package:amin_agent/app/modules/auth%20screen/otp%20verify%20screen/controller/otp_verify_controller.dart';

import '../../modules/view screen/greetings screen/controllers/greetings_screen_controller.dart';
import '../../modules/view screen/notification screen/controllers/notification_screen_controller.dart';
import '../../modules/view screen/total commission  screen/controllers/commission_report_screen_controller.dart';
import '../../modules/view screen/total sales screen/controllers/total_sales_screen_controller.dart';
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
  }
}
