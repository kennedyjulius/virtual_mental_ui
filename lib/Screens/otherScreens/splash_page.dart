import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/authentication/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 4), () {
      Get.off(() => LoginScreen()); // Navigate to LoginScreen after 4 seconds
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(child: Image.asset("assets/chatperson.png", width: 300)),
          ),
          // Second animation
          ScaleTransition(
            scale: animation,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Welcome To ",
                    style: TextStyle(color: Colors.amber, fontSize: 26),
                  ),
                ),

                SizedBox(height: 10,),
                                Center(
                  child: Text(
                    "Mental Health Chatbot ",
                    style: TextStyle(color: Colors.amber, fontSize: 26),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
