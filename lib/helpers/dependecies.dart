import 'package:get/get.dart';
import 'package:virtual_assistance_2/controllers/authentication_controller.dart';
import 'package:virtual_assistance_2/data/api/api_client.dart';
import 'package:virtual_assistance_2/data/repository/authentication_repo.dart';
import 'package:virtual_assistance_2/utils/app_constants.dart';



Future<void> init()async {
  // final sharedPreferences = await SharedPreferences.getInstance();
  // Get.lazyPut(() => sharedPreferences);
  //api cliend
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),  appBaseUrl: AppConstants.BASE_URL));
  //rpos

  //controllers
  
  Get.lazyPut(() => AuthController());
}
// class InitilBindings extends Bindings{
//   var apiClient=ApiClient(appBaseUrl: AppConstants.BASE_URL);
//   @override
//   void dependencies() {
//     var foodrepo=FoodRepo(apiClient: apiClient);
//     var orderRepo=OrderRepo(apiClient: apiClient);
//     var searchRepo=SearchRepo(apiClient: apiClient);
//      Get.put(() => apiClient);
  // Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
//   //repos
//   // Get.put(() => FoodRepo(apiClient: apiClient));
//   // Get.put(() => OrderRepo(apiClient: apiClient));
//   // Get.put(() => SearchRepo(apiClient: apiClient));

//   //controllers
//   Get.put(() => foodrepo);
//   Get.put(() => orderRepo);
//   Get.put(() => searchRepo);
//   Get.put(() => AuthController());
//   }

// }