import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:virtual_assistance_2/utils/app_constants.dart';

class AuthRepo {
  final String appBaseUrl;

  AuthRepo({
    required this.appBaseUrl, required apiClient,
  });

  Future<http.Response> register(String username, String email, String password, String password2) async {
    final Map<String, dynamic> requestBody = {
      'username': username,
      'email': email,
      'password': password,
      'password2': password2,
    };
    return await postData(AppConstants.REGISTRATION_URI, requestBody);
  }

  Future<http.Response> login(String email, String password) async {
    final Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
    };
    return await postData(AppConstants.LOGIN_URI, requestBody);
  }
  
  // Other methods related to user management can be added here as needed

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
