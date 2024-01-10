import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';
Future resetPasswordRequest({id,otp,password}) async {
  final uri = ApiServices.resetPasswordUrl;
  final url = Uri.parse(uri);
  final body = jsonEncode({
    "user_id":id,
    "otp":otp,
    "password": password
  });

  final response = await http.post(url, body: body, headers: headers);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}