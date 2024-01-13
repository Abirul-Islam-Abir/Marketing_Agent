import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:http/http.dart' as http;

Future loginRequest({number, password}) async {
  final uri = ApiServices.loginUrl;
  final url = Uri.parse(uri);
  final body = jsonEncode({"phone": number, "password": password});

  final response = await http.post(url, body: body, headers: headers);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}
