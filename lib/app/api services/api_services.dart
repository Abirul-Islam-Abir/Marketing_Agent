/*Developer Information:
    Name: Abirul Islam Abir
    Email: abir80503@gmail.com
    Phone Number: 01722734871
    App Development Notes:
    - This code is part of the development of MPO.
    - Additional notes or information about the development process*/

// This class manages API-related URLs for the application.
class ApiServices {
  // Base URL for the API
  static const String _baseUrl = 'https://mpotrack.com';

  // Common route for API endpoints
  static const String _endPoint = '/public/api/v1/app';
//Test api working or not
  static const testApi = '$_baseUrl/public/api/test';
  // URLs for various API endpoints
  static String loginUrl = '$_baseUrl$_endPoint/login';
  static String verifyOtpUrl = '$_baseUrl$_endPoint/verify-otp';
  static String logOutUrl = '$_baseUrl$_endPoint/logout';
  static String resendOtpUrl = '$_baseUrl$_endPoint/resend-otp';
  static String forgotPasswordUrl = '$_baseUrl$_endPoint/forgot-password';
  static String resetPasswordUrl = '$_baseUrl$_endPoint/reset-password';
  static String userProfileUrl = '$_baseUrl$_endPoint/me';
  static String resetPassOtpManageUrl =
      '$_baseUrl$_endPoint/reset-password-otp-match';
  static String updateProfileUrl = '$_baseUrl$_endPoint/update-profile';
  static String updateAvatarUrl = '$_baseUrl$_endPoint/update-avatar';
  static String updateNIDUrl = '$_baseUrl$_endPoint/update-nid';
  static String updatePassportUrl = '$_baseUrl$_endPoint/update-passport';
  static String dashboardDataUrl = '$_baseUrl$_endPoint/dashboard-data';
  static String allTargetUrl = '$_baseUrl$_endPoint/targets';
  static String allAgentsUrl = '$_baseUrl$_endPoint';
  static String schedulesUrl = '$_baseUrl$_endPoint';
  static String completeScheduleUrl = '$_baseUrl$_endPoint';
  static String doctorOnboardUrl = '$_baseUrl$_endPoint/doctor/onboard-visited';
  static String allTestUrl = '$_baseUrl$_endPoint';
  static String completedSchedulesPicture = '$_baseUrl$_endPoint';

  // Private constructor to prevent instantiation
  ApiServices._();
}

// Common headers for API requests
final headers = {'Content-Type': 'application/json'};