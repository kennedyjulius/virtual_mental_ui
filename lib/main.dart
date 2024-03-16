import 'package:flutter/material.dart';
import 'package:virtual_assistance_2/Screens/authentication/login_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virtual Assistance',
      theme: ThemeData.light(
        useMaterial3: true).copyWith(
          scaffoldBackgroundColor: Pallete.whiteColor,
          appBarTheme: AppBarTheme(
           backgroundColor: Pallete.whiteColor 
          )
        ),
      home: LoginScreen()
    );
  }
}
