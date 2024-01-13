import 'dart:convert';

import '../api_services.dart';
import 'package:http/http.dart' as http;

Future resendOtpRequest({id}) async {
  final uri = ApiServices.resendOtpUrl;
  final url = Uri.parse(uri);
  final body = jsonEncode({"user_id": id});

  final response = await http.post(url, body: body, headers: headers);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}
