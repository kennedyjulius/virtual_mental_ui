import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:virtual_assistance_2/controllers/auth_controller_firebase.dart';
import 'package:virtual_assistance_2/service/firebase_service.dart';


import 'package:virtual_assistance_2/utils/colors.dart';

import 'package:virtual_assistance_2/Screens/authentication/login_screen.dart';
import 'package:virtual_assistance_2/Screens/authentication/signup_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/splash_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAHoT9PrH4JN1CGgpRjXU_QNxekIk3UGUQ",
      appId: "1:705722007945:android:79a0768739457e8cfba158",
      messagingSenderId: "705722007945",
      projectId: "brightmain-8c5f4",
    ),
  ).then((value) => Get.put(AuthController()));

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
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
       // Bind the UserDataService to the GetMaterialApp
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<UserDataService>(() => UserDataService());
      }
      )
    );
  }
}
