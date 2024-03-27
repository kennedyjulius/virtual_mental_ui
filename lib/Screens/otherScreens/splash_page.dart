import 'dart:async';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/authentication/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    // ignore: unnecessary_new
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(Duration(seconds: 4),() => Get.offNamed(SignupScreen() as String));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/chatperson.png", width: 300,)),
          ),

          //second annimation
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Text("Welcome To Virtual Health Assistant", style: TextStyle(color: Colors.amber, fontSize: 26),)
            ),
          )
        ],
      ),
    );
  }
}
