import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:http/http.dart' as http;

Future resetPassOtpManageRequest({id, otp}) async {
  final uri = ApiServices.resetPassOtpManageUrl;
  final url = Uri.parse(uri);
  final body = jsonEncode({"user_id": id, "otp": otp}); // Encode body as JSON
  final response = await http.post(url, body: body, headers: headers);

  final decodedResponse = jsonDecode(response.body);
  print(decodedResponse);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }

  return decodedResponse;
}
