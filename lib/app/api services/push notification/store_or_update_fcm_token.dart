import 'dart:convert';

import 'package:amin_agent/app/api%20services/api_services.dart';
import 'package:http/http.dart' as http;
// This function initiates a login request by sending a POST request to the specified API endpoint.
// It expects 'number' and 'password' parameters representing the user's phone number and password.
Future storeOrUpdateFcmTokenRequest({fcmToken, token}) async {
  // Get the login API URL from the ApiServices class
  final uri = '${ApiServices.storeOrUpdateFcmTokenUrl}$fcmToken';

  // Parse the URL into a Uri object
  final url = Uri.parse(uri);

  // Create headers with the specified content type and include the user's authentication token
  final headerWithToken = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
  // Send a POST request to the API endpoint with the encoded body and headers
  final response = await http.post(url, headers: headerWithToken);

  // Decode the response body from JSON format
  final decodedResponse = jsonDecode(response.body);
  // Check if the request was successful (status code 200) and the API indicates success
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    // Return the decoded response if the request was successful
    return decodedResponse;
  }

  // Return the decoded response in case of any other scenario (e.g., unsuccessful request)
  return decodedResponse;
}