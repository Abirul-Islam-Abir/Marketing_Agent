import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

Future forgotPasswordRequest({number}) async {
  final uri = ApiServices.forgotPasswordUrl;
  final url = Uri.parse(uri);
  final body = jsonEncode({ "phone": number});

  final response = await http.post(url, body: body, headers: headers);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}