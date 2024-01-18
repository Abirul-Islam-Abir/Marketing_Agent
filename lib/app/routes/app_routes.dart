part of 'app_pages.dart';

abstract class RouteName {
  RouteName._();
  static const initial = RouteName.splashScreen ;
  static const splashScreen = '/splash-screen';
  static const loginScreen = '/login-screen';
  static const profileScreen = '/profile-screen';
  static const scheduleScreen = '/schedule-screen';
  static const notificationScreen = '/notification-screen';
  static const greetingsScreen = '/greetings-screen';
  static const mapScreen = '/map-screen';
  static const bottomNav = '/bottomNav-screen';
  static const dashboardScreen = '/dashboard-screen';
  static const totalCommissionScreen = '/total-commission-screen';
  static const totalSalesScreen = '/total-sales-screen';
  static const salesTargetScreen = '/sales-target-screen';
  static const doctorOnboardScreen = '/doctor-onboard-screen';
  static const otpVerifyScreen = '/otp-verify-screen';
  static const forgetPasswordScreen = '/forget-password-screen';
  static const passwordSetScreen = '/password-set-screen';
  static const doctorVisitedScreen = '/doctor-visited-screen';
  static const profileDetailsScreen = '/profile-details-screen';
}

