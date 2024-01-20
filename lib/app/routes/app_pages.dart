import '../data/const/export.dart';
import '../modules/view screen/doctor visited screen/bindings/doctor_visited_screen_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: RouteName.loginScreen,
      transition: Transition.rightToLeftWithFade,
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
      transition: Transition.rightToLeftWithFade,
      page: () => const BottomNav(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => DashboardScreenView(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: RouteName.totalCommissionScreen,
      page: () => TotalCommissionScreen(),
      binding: TotalCommissionScreenBinding(),
    ),
    GetPage(
      name: RouteName.totalSalesScreen,
      page: () => const TotalSalesScreen(),
      binding: TotalSalesScreenBinding(),
    ),
    GetPage(
      name: RouteName.salesTargetScreen,
      page: () => const SalesTargetScreenView(),
      binding: SalesTargetScreenBinding(),
    ),
    GetPage(
      name: RouteName.doctorOnboardScreen,
      page: () => const DoctorOnboardScreenView(),
      binding: DoctorOnboardScreenBinding(),
    ),
    GetPage(
      name: RouteName.otpVerifyScreen,
      transition: Transition.rightToLeftWithFade,
      page: () => OtpVerifyScreen(),
      binding: OtpVerifyScreenBinding(),
    ),
    GetPage(
      name: RouteName.forgetPasswordScreen,
      transition: Transition.rightToLeftWithFade,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordScreenBinding(),
    ),
    GetPage(
      name: RouteName.initial,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: RouteName.passwordSetScreen,
      transition: Transition.rightToLeftWithFade,
      page: () => PasswordSetScreenView(),
      binding: PasswordSetScreenBinding(),
    ),
    GetPage(
      name: RouteName.doctorVisitedScreen,
      page: () => const DoctorVisitedScreenView(),
      binding: DoctorVisitedScreenBinding(),
    ),
  ];
}
