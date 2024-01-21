import 'dart:convert';

import '../api_services.dart';
import 'package:http/http.dart' as http;

// This function initiates a request to resend an OTP (One-Time Password) by sending a POST request to the specified API endpoint.
// It expects an 'id' parameter representing the user ID.
Future resendOtpRequest({id}) async {
  // Get the resend OTP API URL from the ApiServices class
  final uri = ApiServices.resendOtpUrl;

  // Parse the URL into a Uri object
  final url = Uri.parse(uri);

  // Encode the request body into JSON format with the provided user ID
  final body = jsonEncode({"user_id": id});

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
