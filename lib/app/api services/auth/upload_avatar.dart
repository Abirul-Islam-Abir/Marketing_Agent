import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

Future<Map<String, dynamic>> uploadImageRequest(
    {required String path, required String token}) async {
  var uri = Uri.parse(ApiServices.updateAvatarUrl);
  var request = http.MultipartRequest("POST", uri);
  request.headers['Authorization'] = 'Bearer $token';
  var imageUpload = await http.MultipartFile.fromPath('avatar', path);
  request.files.add(imageUpload);
  var response = await request.send();
  if (response.statusCode == 200) {
    final decodedResponse = jsonDecode(await response.stream.bytesToString());
    return decodedResponse;
  } else {
    final decodedResponse = jsonDecode(await response.stream.bytesToString());
    return decodedResponse;
  }
}
