
// Future<void> init() async {
//   //final sharedPreferences = await SharedPreferences.getInstance();

//   // Get.lazyPut(() => sharedPreferences);
//   // API client
//   Get.lazyPut(() => Apiclient(
//         appBaseUrl: AppConstants.BASE_URL,
//         token: '',
//       ));

//   // Repositories
//   Get.lazyPut(() => PopularProductRepo(apiclient: Get.find()));
//   Get.lazyPut(() => RecommendedProductRepo(apiclient: Get.find()));
//   Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));

//   //Controllers
//   Get.lazyPut(() => PopularProductController(
//       popularProductRepo: Get.find<PopularProductRepo>()));
//   Get.lazyPut(
//       () => RecommendedProductController(recommendedProductRepo: Get.find()));
//   Get.lazyPut(() => CartController(cartRepo: Get.find()));
// }
