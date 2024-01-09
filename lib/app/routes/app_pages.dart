
import 'package:amin_agent/app/modules/auth%20screen/forget%20password%20screen/binding/forget_password_binding.dart';
import 'package:amin_agent/app/modules/auth%20screen/forget%20password%20screen/view/forget_password_screen.dart';
import 'package:amin_agent/app/modules/auth%20screen/otp%20verify%20screen/binding/otp_verify_screen_binding.dart';
import 'package:amin_agent/app/modules/auth%20screen/otp%20verify%20screen/view/otp_screen.dart';
import 'package:amin_agent/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:amin_agent/app/modules/view%20screen/doctor%20onboard%20screen/views/doctor_onboard_screen_view.dart';

import '../data/const/export.dart';
 import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/view screen/doctor onboard screen/bindings/doctor_onboard_screen_binding.dart';
import '../modules/view screen/greetings screen/bindings/greetings_screen_binding.dart';
import '../modules/view screen/greetings screen/views/greetings_screen_view.dart';
import '../modules/view screen/map screen/bindings/map_screen_binding.dart';
import '../modules/view screen/map screen/views/map_screen_view.dart';
import '../modules/view screen/notification screen/bindings/notification_screen_binding.dart';
import '../modules/view screen/notification screen/views/notification_screen_view.dart';
import '../modules/view screen/sales target  screen/bindings/sales_target_screen_binding.dart';
import '../modules/view screen/sales target  screen/views/sales_target_screen_view.dart';
  import '../modules/view screen/total commission  screen/bindings/commission_report_screen_binding.dart';
import '../modules/view screen/total commission  screen/views/total_commission_screen.dart';
import '../modules/view screen/total sales screen/bindings/total_sales_screen_binding.dart';
import '../modules/view screen/total sales screen/views/total_sales_screen.dart';

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
      page: () =>   DashboardScreenView(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: RouteName.commissionReportScreen,
      page: () =>   TotalCommissionScreen(),
      binding: TotalCommissionScreenBinding(),
    ),
    GetPage(
      name: RouteName.salesReportScreen,
      page: () => const TotalSalesScreen(),
      binding: TotalSalesScreenBinding(),
    ),
    GetPage(
      name: RouteName.salesTargetScreen,
      page: () =>   const SalesTargetScreenView(),
      binding: SalesTargetScreenBinding(),
    ),
    GetPage(
      name: RouteName.doctorOnboardScreen,
      page: () => const DoctorOnboardScreenView(),
      binding: DoctorOnboardScreenBinding(),
    ),
    GetPage(
      name: RouteName.otpVerifyScreen,
      page: () =>   OtpVerifyScreen(),
      binding: OtpVerifyScreenBinding(),
    ),
    GetPage(
      name: RouteName.forgetPasswordScreen,
      page: () =>   ForgetPasswordScreen(),
      binding: ForgetPasswordScreenBinding(),
    ),
    GetPage(
      name: RouteName.initial,
      page: () =>   SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}

