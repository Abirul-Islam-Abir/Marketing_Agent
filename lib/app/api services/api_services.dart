
class ApiServices {
  static const String _baseUrl = 'https://mpotrack.com';
  static const String _route = '/public/api/v1/app';
  static String loginUrl = '$_baseUrl$_route/login';
  static String verifyOtpUrl = '$_baseUrl$_route/verify-otp';
  static String logOutUrl = '$_baseUrl$_route/logout';
  static String resendOtpUrl = '$_baseUrl$_route/resend-otp';
  static String forgotPasswordUrl = '$_baseUrl$_route/forgot-password';
  static String resetPasswordUrl = '$_baseUrl$_route/reset-password';
  static String userProfileUrl = '$_baseUrl$_route/me';
  static String resetPassOtpManageUrl = '$_baseUrl$_route/reset-password-otp-match';
  static String updateProfileUrl = '$_baseUrl$_route/update-profile';
  static String updateAvatarUrl = '$_baseUrl$_route/update-avatar';
  static String updateNIDUrl = '$_baseUrl$_route/update-nid';

  ApiServices._();
}

final headers = {'Content-Type': 'application/json'};
