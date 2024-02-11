import '../data/const/export.dart';

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
      page: () => const GreetingsScreenView(),
      binding: GreetingsScreenBinding(),
    ),
    GetPage(
      name: RouteName.bottomNav,
      transition: Transition.rightToLeftWithFade,
      page: () => BottomNav(),
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
      page: () => TotalSalesScreen(),
      binding: TotalSalesScreenBinding(),
    ),
    GetPage(
      name: RouteName.agentScreen,
      page: () => TargetAgentsScreenView(),
      binding: TargetAgentsScreenBinding(),
    ),
    GetPage(
      name: RouteName.doctorOnboardScreen,
      page: () => DoctorOnboardScreenView(),
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
      page: () => DoctorVisitedScreenView(),
      binding: DoctorVisitedScreenBinding(),
    ),
    GetPage(
      name: RouteName.allTargetScreen,
      page: () => AllTargetsScreenView(),
      binding: AllTargetsScreenBinding(),
    ),
    GetPage(
      name: RouteName.allTestScreen,
      page: () => AllTestScreen(),
      binding: AllTestScreenBinding(),
    ),
    GetPage(
      name: RouteName.completedScheduleScreen,
      page: () => CompletedScheduleScreen(),
      binding: CompletedScheduleScreenBinding(),
    ),
    GetPage(
      name: RouteName.targetWiseDoctorVisitedScreen,
      page: () => TargetWiseDoctorVisitedScreen(),
      binding: TargetWiseDoctorVisitedBinding(),
    ),
    GetPage(
        name: RouteName.defaultMapScreen,
        page: () => DefaultMap(),
        binding: MapScreenBinding())
  ];
}