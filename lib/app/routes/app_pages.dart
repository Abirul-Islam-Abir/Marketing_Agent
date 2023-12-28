import 'package:amin_agent/app/modules/bottom%20nav/binding/bottom_nav_binding.dart';
 import 'package:amin_agent/app/modules/view%20screen/map_screen/bindings/map_screen_binding.dart';
import 'package:amin_agent/app/modules/view%20screen/map_screen/views/map_screen_view.dart';
import 'package:get/get.dart';

import '../modules/auth screen/login screen/bindings/login_screen_binding.dart';
import '../modules/auth screen/login screen/views/login_screen_view.dart';

import '../modules/bottom nav/views/bottom_nav.dart';
import '../modules/view screen/greetings_screen/bindings/greetings_screen_binding.dart';
import '../modules/view screen/greetings_screen/views/greetings_screen_view.dart';
import '../modules/view screen/notification_screen/bindings/notification_screen_binding.dart';
import '../modules/view screen/notification_screen/views/notification_screen_view.dart';
import '../modules/view screen/profile screen/bindings/profile_screen_binding.dart';
import '../modules/view screen/profile screen/views/profile_screen_view.dart';
import '../modules/view screen/shedule screen/bindings/shedule_screen_binding.dart';
import '../modules/view screen/shedule screen/views/shedule_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: RouteName.loginScreen,
      page: () =>   LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: RouteName.profileScreen,
      page: () =>   ProfileScreenView(),
      binding: ProfileScreenBinding(),
    ),
    GetPage(
      name: RouteName.scheduleScreen,
      page: () =>   ScheduleScreenView(),
      binding: SheduleScreenBinding(),
    ),
    GetPage(
      name: RouteName.notificationScreen,
      page: () =>   NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: RouteName.greetingsScreen,
      page: () =>     GreetingsScreenView(),
      binding: GreetingsScreenBinding(),
    ),
    GetPage(
      name: RouteName.mapScreen,
      page: () =>     const MapScreenView(),
      binding: MapScreenBinding(),
    ),
    GetPage(
      name: RouteName.bottomNav,
      page: () =>   const BottomNav(),
      binding: BottomNavBinding(),
    ),
  ];
}
