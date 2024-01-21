import 'dart:convert';

import 'package:http/http.dart' as http;

import '../api_services.dart';// This function initiates a request to reset the user's password by sending a POST request to the specified API endpoint.
// It expects 'id', 'otp', and 'password' parameters representing the user ID, OTP (One-Time Password), and the new password.
Future resetPasswordRequest({id, otp, password}) async {
  // Get the reset password API URL from the ApiServices class
  final uri = ApiServices.resetPasswordUrl;

  // Parse the URL into a Uri object
  final url = Uri.parse(uri);

  // Encode the request body into JSON format with the provided user ID, OTP, and new password
  final body = jsonEncode({
    "user_id": id,
    "otp": otp,
    "password": password,
  });

  // Send a POST request to the API endpoint with the encoded body and headers
  final response = await http.post(url, body: body, headers: headers);

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
