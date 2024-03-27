import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/data/repository/authentication_repo.dart';
import 'package:virtual_assistance_2/model/user_model.dart';
import 'package:virtual_assistance_2/utils/show_custom_snackbar.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = Get.find();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  static AuthController get to => Get.find<AuthController>(); // Define the static method to access the controller

  Future<UserModel?> registration(String username, String email, String password, String password2) async {
    try {
      _isLoading = true;
      update();

      final response = await _authRepo.register(username, email, password, password2);

      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(jsonDecode(response.body ?? "{}"));
        showCustomSnackBar("Registration successful",
            title: "Success", backgroundColor: Colors.green);
        return userModel;
      } else {
        showCustomSnackBar("Registration failed",
            title: "Error", backgroundColor: Colors.red);
      }
    } catch (e) {
      print("Error during registration: $e");
      showCustomSnackBar("Something went wrong",
          title: "Error", backgroundColor: Colors.red);
    } finally {
      _isLoading = false;
      update();
    }
    return null;
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      _isLoading = true;
      update();

      final response = await _authRepo.login(email, password);

      if (response.statusCode == 200) {
        final userModel = UserModel.fromJson(jsonDecode(response.body ?? "{}"));
        showCustomSnackBar("Login successful",
            title: "Success", backgroundColor: Colors.green);
        return userModel;
      } else {
        showCustomSnackBar("Login failed",
            title: "Error", backgroundColor: Colors.red);
      }
    } catch (e) {
      print("Error during login: $e");
      showCustomSnackBar("Something went wrong",
          title: "Error", backgroundColor: Colors.red);
    } finally {
      _isLoading = false;
      update();
    }
    return null;
  }
}
