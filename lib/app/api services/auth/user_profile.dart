import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';
Future userProfileRequest() async {
  final uri = ApiServices.userProfileUrl;
  final url = Uri.parse(uri);
  final response = await http.get(url,headers: headerWithToken);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    return decodedResponse;
  }
  return decodedResponse;
}