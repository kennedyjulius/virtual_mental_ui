import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/splash_page.dart';
import 'package:virtual_assistance_2/data/repository/authentication_repo.dart';
import 'package:virtual_assistance_2/model/user_model.dart';
import "package:virtual_assistance_2/helpers/dependecies.dart" as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Get.find<FoodController>().getFoodList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
        future: AuthRepo.getUserInstance(),
        builder: (context, snap) {
          if (snap.hasData) {
            return GetMaterialApp(
              // initialBinding: InitilBindings(),

              debugShowCheckedModeBanner: false,
              title: 'Online Ordering App',
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
              home: SplashScreen(),
              // home: HomePage(),
              // home: Home(),
              //  initialRoute: RouteHelper.initial,
              // getPages: RouteHelper.routes,
              // home: RegisterPage(),
            );
          }
          return GetMaterialApp(
            // initialBinding: InitilBindings(),
            debugShowCheckedModeBanner: false,
           // title: 'Online Ordering App',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            // home: LoginPage(),
            home: SplashScreen(),
            // home: Home(),
            //initialRoute: RouteHelper.homeScreen,
            // initialRoute: RouteHelper.userProfile,
            //getPages: RouteHelper.routes,
            // home: RegisterPage(),
          );
        });
  }
}
