// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'package:virtual_assistance_2/data/apis/api_client.dart';
// import 'package:virtual_assistance_2/data/repository/authentication_repo.dart';
// import 'package:virtual_assistance_2/controllers/authentication_controller.dart';
// import 'package:virtual_assistance_2/utils/app_constants.dart';

// Future<void> init() async {
//   // Initialize SharedPreferences
//   final sharedPreferences = await SharedPreferences.getInstance();
//   Get.lazyPut(() => sharedPreferences);

//   // Initialize API client
//   Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

//   // Initialize Authentication repository
//   Get.lazyPut(() => AuthRepo(apiClient: Get.find(), appBaseUrl: AppConstants.BASE_URL));

//   // Initialize Authentication controller
//   // Get.lazyPut(() => AuthController());
// }
