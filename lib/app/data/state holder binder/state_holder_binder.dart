
import '../const/export.dart';

class StateHolderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => ProfileScreenController());
    Get.lazyPut(() => ScheduleScreenController());
    Get.lazyPut(() => NotificationScreenController());
    Get.lazyPut(() => GreetingsScreenController());
    Get.lazyPut(() => BottomNavController());
    Get.lazyPut(() => DashboardScreenController());
    Get.lazyPut(() => CommissionReportScreenController());
    Get.lazyPut(() => SalesReportScreenController());
  }
}
