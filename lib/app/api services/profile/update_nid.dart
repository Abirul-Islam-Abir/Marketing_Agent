import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

// This function initiates a request to upload an NID (National ID) file by sending a multipart POST request to the specified API endpoint.
// It expects 'filePath' representing the path to the NID file and 'token' representing the user's authentication token.
Future<Map<String, dynamic>> uploadNIDFileRequest({filePath, token}) async {
  // Parse the API URL for updating NID from the ApiServices class
  var uri = Uri.parse(ApiServices.updateNIDUrl);

  // Create a multipart POST request
  var request = http.MultipartRequest("POST", uri);

  // Set the Authorization header with the user's authentication token
  request.headers['Authorization'] = 'Bearer $token';

  // Add the NID file to the request
  var nidFileUpload =
  await http.MultipartFile.fromPath('nid_pdf', filePath.path);
  request.files.add(nidFileUpload);

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
