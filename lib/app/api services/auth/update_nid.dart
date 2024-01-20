import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

Future<Map<String, dynamic>> uploadNIDFileRequest({filePath, token}) async {
  var uri = Uri.parse(ApiServices.updateNIDUrl);
  var request = http.MultipartRequest("POST", uri);
  request.headers['Authorization'] = 'Bearer $token';
  // Add the PDF file
  var file = await http.MultipartFile.fromPath('nid_pdf', filePath.path);
  request.files.add(file);
  var response = await request.send();
  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(await response.stream.bytesToString());
    return decodedResponse;
  } else {
    final decodedResponse = jsonDecode(await response.stream.bytesToString());
    return decodedResponse;
  }
}
