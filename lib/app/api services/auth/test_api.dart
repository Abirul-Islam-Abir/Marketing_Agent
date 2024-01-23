import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

// This function initiates a request to retrieve the user profile information by sending a GET request to the specified API endpoint.
// It expects a 'token' parameter representing the user's authentication token.
Future testApiRequest() async {
  // Get the user profile API URL from the ApiServices class
  const uri = ApiServices.testApi;
  // Parse the URL into a Uri object
  final url = Uri.parse(uri);
  // Send a GET request to the API endpoint with the headers
  final response = await http.get(url, headers: headers);
  // Decode the response body from JSON format
  final decodedResponse = jsonDecode(response.body);
  // Check if the request was successful (status code 200) and the API indicates success
  if (response.statusCode == 200) {
    // Return the decoded response if the request was successful
    return decodedResponse;
  }
}
