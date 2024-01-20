import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

Future updateProfileRequest(
    {name, designation, nid, passport, certification, address, token}) async {
  final url = ApiServices.updateProfileUrl;
  final uri = Uri.parse(url);
  final headerWithToken = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  final body = {
    'name': name,
    'designation': designation,
    'nid': nid,
    'passport': passport,
    'certification': certification,
    'address': address,
  };
  final response =
      await http.post(uri, body: jsonEncode(body), headers: headerWithToken);
  final decodedResponse = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return decodedResponse;
  }
  return decodedResponse;
}
