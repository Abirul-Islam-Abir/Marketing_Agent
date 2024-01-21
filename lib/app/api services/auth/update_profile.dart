import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';

// This function initiates a request to update user profile information by sending a POST request to the specified API endpoint.
// It expects parameters such as 'name', 'designation', 'nid', 'passport', 'certification', 'address', and 'token'.
Future updateProfileRequest({
  name,
  designation,
  nid,
  passport,
  certification,
  address,
  token,
}) async {
  // Get the update profile API URL from the ApiServices class
  final url = ApiServices.updateProfileUrl;

  // Parse the URL into a Uri object
  final uri = Uri.parse(url);

  // Create headers with the specified content type and include the user's authentication token
  final headerWithToken = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };

  // Create a Map representing the request body with the provided user profile information
  final body = {
    'name': name,
    'designation': designation,
    'nid': nid,
    'passport': passport,
    'certification': certification,
    'address': address,
  };

  // Send a POST request to the API endpoint with the encoded body and headers
  final response =
      await http.post(uri, body: jsonEncode(body), headers: headerWithToken);

  // Decode the response body from JSON format
  final decodedResponse = jsonDecode(response.body);

  // Check if the request was successful (status code 200)
  if (response.statusCode == 200) {
    // Return the decoded response if the request was successful
    return decodedResponse;
  }

  // Return the decoded response in case of any other scenario (e.g., unsuccessful request)
  return decodedResponse;
}
