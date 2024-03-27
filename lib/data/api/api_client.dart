import 'dart:convert';

import 'package:get/get.dart';
import 'package:virtual_assistance_2/utils/app_constants.dart';
import 'package:http/http.dart' as http; // Import http package for making HTTP requests

class ApiClient {
  final String appBaseUrl;

  ApiClient({
    required this.appBaseUrl,
  });

  // Method for making POST requests
  Future<http.Response> postData(String uri, Map<String, dynamic> body) async {
    final url = Uri.parse('$appBaseUrl/$uri');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    return response;
  }
}
