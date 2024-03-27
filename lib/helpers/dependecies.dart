import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/data/repository/authentication_repo.dart';
import 'package:virtual_assistance_2/data/api/api_client.dart';
import 'package:virtual_assistance_2/controllers/authentication_controller.dart';
import 'package:virtual_assistance_2/main.dart';
import 'package:virtual_assistance_2/utils/app_constants.dart';

void main() {
  init();
  runApp(MyApp());
}

void init() {
  Get.lazyPut(() => ApiClient(appBaseUrl: 'your_base_url_here'));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => AuthController());
}
