import 'dart:convert';

import 'package:http/http.dart' as http;
import '../api_services.dart';

// This function initiates a request to retrieve the user profile information by sending a GET request to the specified API endpoint.
// It expects a 'token' parameter representing the user's authentication token.
Future storeLatAndLongRequest(
    {token, id, uid, completionLat, completionLang}) async {
  // Get the user profile API URL from the ApiServices class
  final uri = Uri.parse(
      '${ApiServices.storeCurrentLatAndLongUrl}/$id/schedule/store-lat-lon');

  // Parse the API URL for updating the avatar from the ApiServices class
  // Create a multipart POST request
  var request = http.MultipartRequest("POST", uri);
  // Set the Authorization header with the user's authentication token
  request.headers['Authorization'] = 'Bearer $token';
  // Add additional fields
  request.fields['uid'] = uid;
  request.fields['lat'] = completionLat;
  request.fields['lon'] = completionLang;

  // Send the multipart request and retrieve the response
  var response = await request.send();
  // Check if the request was successful (status code 200)
  final decodedResponse = jsonDecode(await response.stream.bytesToString());

  if (response.statusCode == 200) {
    // Decode the response body from JSON format
    // Return the decoded response if the request was successful
    return decodedResponse;
  }
  // Return the decoded response if the request was successful
  return decodedResponse;
}