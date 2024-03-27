import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/data/repository/authentication_repo.dart';


import 'package:virtual_assistance_2/utils/colors.dart';

import 'package:virtual_assistance_2/Screens/authentication/login_screen.dart';
import 'package:virtual_assistance_2/Screens/authentication/signup_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/splash_page.dart';
import 'package:virtual_assistance_2/helpers/dependecies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  dep.init();
  runApp(MyApp());
}

// Future<void> init() async {
//   Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
//   Get.lazyPut(() => AuthRepo(apiClient: Get.find(), appBaseUrl: AppConstants.BASE_URL));
//   Get.lazyPut(() => AuthController());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthRepo.getUserInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mental Health Assistance',
            theme: ThemeData.light().copyWith(
              scaffoldBackgroundColor: Pallete.whiteColor,
              appBarTheme: AppBarTheme(
                backgroundColor: Pallete.whiteColor,
              ),
            ),
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => SplashScreen()),
              GetPage(name: '/login', page: () => LoginScreen()),
              GetPage(name: '/signup', page: () => SignupScreen()),
              GetPage(name: '/home', page: () => HomeScreen()),
            ],
          );
        }
        // Handle other cases if needed
        return CircularProgressIndicator(); // Placeholder while loading
      },
    );
  }
}
