import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';
// This function initiates a request to update a passport file by sending a multipart POST request to the specified API endpoint.
// It expects 'path' representing the path to the passport file and 'token' representing the user's authentication token.
Future<Map<String, dynamic>> updatePassportRequest({filePath, token}) async {
  // Parse the API URL for updating the passport file from the ApiServices class
  var uri = Uri.parse(ApiServices.updatePassportUrl);

  // Create a multipart POST request
  var request = http.MultipartRequest("POST", uri);

  // Set the Authorization header with the user's authentication token
  request.headers['Authorization'] = 'Bearer $token';

  // Add the passport file to the request
  var passportFileUpload =
  await http.MultipartFile.fromPath('passport_pdf', filePath.path);
  request.files.add(passportFileUpload);

  // Send the multipart request and retrieve the response
  var response = await request.send();

  // Decode the response body from JSON format
  final decodedResponse = jsonDecode(await response.stream.bytesToString());

  // Check if the request was successful (status code 200)
  if (response.statusCode == 200) {
    // Return the decoded response if the request was successful
    return decodedResponse;
  }

  // Return the decoded response in case of any other scenario (e.g., unsuccessful request)
  return decodedResponse;
}
