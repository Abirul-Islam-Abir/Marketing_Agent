part of 'app_pages.dart';

abstract class RouteName {
  RouteName._();
  static const initial = RouteName.loginScreen ;
  static const loginScreen = '/login-screen';
  static const profileScreen = '/profile-screen';
  static const scheduleScreen = '/schedule-screen';
  static const notificationScreen = '/notification-screen';
  static const greetingsScreen = '/greetings-screen';
  static const mapScreen = '/map-screen';
  static const bottomNav = '/bottomNav-screen';
  static const dashboardScreen = '/Dashboard-screen';
  static const commissionReportScreen = '/Commission-Report-screen';
  static const salesReportScreen = '/Sales-Report-screen';
  static const salesTargetGroupScreen = '/Sales-Target-Group-Screen';
  static const doctorOnboardScreen = '/Doctor-Onboard-Screen';
}

