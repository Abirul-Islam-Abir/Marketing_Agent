import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

// This function initiates a request to upload an image (avatar) by sending a multipart POST request to the specified API endpoint.
// It expects 'path' representing the path to the image file and 'token' representing the user's authentication token.
Future<Map<String, dynamic>> completeScheduleRequest(
    {path, token, uid, completionLat, completionLang,id}) async {
  // Parse the API URL for updating the avatar from the ApiServices class
  var uri = Uri.parse('${ApiServices.completeScheduleUrl}/$id/complete-schedule');

  // Create a multipart POST request
  var request = http.MultipartRequest("POST", uri);

  // Set the Authorization header with the user's authentication token
  request.headers['Authorization'] = 'Bearer $token';

  // Add the image file to the request
  var imageUpload = await http.MultipartFile.fromPath('picture', path);
  request.files.add(imageUpload);
  // Add additional fields
  request.fields['uid'] = uid;
  request.fields['completion_lat'] = completionLat;
  request.fields['completion_lang'] = completionLang;

  // Send the multipart request and retrieve the response
  var response = await request.send();
  // Check if the request was successful (status code 200)
  if (response.statusCode == 200) {
    // Decode the response body from JSON format
    final decodedResponse = jsonDecode(await response.stream.bytesToString());
    // Return the decoded response if the request was successful
    return decodedResponse;
  }
  final decodedResponse = jsonDecode(await response.stream.bytesToString());
  // Return the decoded response if the request was successful
  return decodedResponse;
}