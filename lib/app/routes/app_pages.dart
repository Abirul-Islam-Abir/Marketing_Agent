
import '../data/const/export.dart';
import '../modules/view screen/commission report screen/views/commission_report_screen_view.dart';
import '../modules/view screen/sales target group screen/bindings/sales_target_group_screen_binding.dart';
import '../modules/view screen/sales target group screen/views/sales_target_group_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: RouteName.profileScreen,
      page: () => ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: RouteName.scheduleScreen,
      page: () => ScheduleScreenView(),
      binding: ScheduleScreenBinding(),
    ),
    GetPage(
      name: RouteName.notificationScreen,
      page: () => NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: RouteName.greetingsScreen,
      page: () => GreetingsScreenView(),
      binding: GreetingsScreenBinding(),
    ),
    GetPage(
      name: RouteName.mapScreen,
      page: () => const MapScreenView(),
      binding: MapScreenBinding(),
    ),
    GetPage(
      name: RouteName.bottomNav,
      page: () => const BottomNav(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => const DashboardScreenView(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: RouteName.commissionReportScreen,
      page: () =>   CommissionReportScreenView(),
      binding: CommissionReportScreenBinding(),
    ),
    GetPage(
      name: RouteName.salesReportScreen,
      page: () => const SalesReportScreenView(),
      binding: SalesReportScreenBinding(),
    ),
    GetPage(
      name: RouteName.salesTargetGroupScreen,
      page: () => const SalesTargetGroupScreenView(),
      binding: SalesTargetGroupScreenBinding(),
    ),
  ];
}
