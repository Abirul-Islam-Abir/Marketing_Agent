import 'package:amin_agent/app/modules/view%20screen/all%20tests%20screen/bindings/all_test_screen_bindings.dart';
import 'package:amin_agent/app/modules/view%20screen/all%20tests%20screen/view/all_test_screen.dart';
import 'package:amin_agent/app/modules/view%20screen/completed_shedule_screen/view/completed_schedule_screen.dart';
import 'package:amin_agent/app/modules/view%20screen/target%20agents%20%20screen/bindings/targets_agents_screen_binding.dart';
import 'package:amin_agent/app/modules/view%20screen/target%20agents%20%20screen/views/target_agents_screen_view.dart';

import '../data/const/export.dart';
import '../modules/view screen/all targets screen/bindings/all_targets_screen_binding.dart';
import '../modules/view screen/all targets screen/views/all_targets_screen_view.dart';
import '../modules/view screen/completed_shedule_screen/bindings/complete_schedule_bindings.dart';
import '../modules/view screen/doctor visited screen/bindings/doctor_visited_screen_binding.dart';
import '../modules/view screen/target wise doctor visited/bindings/target_wise_doctor_visited_bindings.dart';
import '../modules/view screen/target wise doctor visited/view/target_wise_doctor_visited_screen.dart';

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
      page: () =>   NotificationScreenView(),
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
      page: () =>   BottomNav(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: RouteName.dashboardScreen,
      page: () => DashboardScreenView(),
      binding: DashboardScreenBinding(),
    ),
    GetPage(
      name: RouteName.totalCommissionScreen,
      page: () =>   TotalCommissionScreen(),
      binding: TotalCommissionScreenBinding(),
    ),
    GetPage(
      name: RouteName.totalSalesScreen,
      page: () =>   TotalSalesScreen(),
      binding: TotalSalesScreenBinding(),
    ),
    GetPage(
      name: RouteName.agentScreen,
      page: () => TargetAgentsScreenView(),
      binding: TargetAgentsScreenBinding(),
    ),
    GetPage(
      name: RouteName.doctorOnboardScreen,
      page: () =>   DoctorOnboardScreenView(),
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
      page: () =>   DoctorVisitedScreenView(),
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
    ), GetPage(
      name: RouteName.targetWiseDoctorVisitedScreen,
      page: () => const TargetWiseDoctorVisitedScreen(),
      binding: TargetWiseDoctorVisitedBinding(),
    ),
  ];
}