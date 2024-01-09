import 'package:amin_agent/app/data/utils/store_data.dart';

class ApiServices {
  static const String _baseUrl = 'https://mpotrack.com';
  static const String _route = '/public/api';
  static String loginUrl = '$_baseUrl$_route/login';
  static String verifyOtpUrl = '$_baseUrl$_route/verify-otp';
  static String logOutUrl = '$_baseUrl$_route/logout';

  ApiServices._();
}

final headers = {'Content-Type': 'application/json'};
final headerWithToken = {
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ${StoreData.token}', // Corrected header for Bearer token
};