import 'dart:convert';

import 'package:http/http.dart' as http;
import '../api_services.dart';

// This function initiates a request to retrieve the user profile information by sending a GET request to the specified API endpoint.
// It expects a 'token' parameter representing the user's authentication token.
Future readNotificationRequest({token,id}) async {
  // Get the user profile API URL from the ApiServices class
  final uri = '${ApiServices.notificationReadUrl}$id';

  // Parse the URL into a Uri object
  final url = Uri.parse(uri);

  // Create headers with the specified content type and include the user's authentication token
  final headerWithToken = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  // Send a GET request to the API endpoint with the headers
  final response = await http.post(url, headers: headerWithToken);

  // Decode the response body from JSON format
  final decodedResponse = jsonDecode(response.body);
  print(decodedResponse);
  // Check if the request was successful (status code 200) and the API indicates success
  if (response.statusCode == 200 && decodedResponse['success'] == true) {
    // Return the decoded response if the request was successful
    return decodedResponse;
  }

  // Return the decoded response in case of any other scenario (e.g., unsuccessful request)
  return decodedResponse;
}