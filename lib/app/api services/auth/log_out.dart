import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:http/http.dart' as http;

Future logOutRequest(token) async {
  final uri = ApiServices.logOutUrl;
  final url = Uri.parse(uri);
  final headerWithToken = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  final response = await http.post(url, headers: headerWithToken);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}
