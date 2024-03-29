import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/authentication/signup_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/controllers/auth_controller_firebase.dart';
import 'package:virtual_assistance_2/controllers/authentication_controller.dart';
import 'package:virtual_assistance_2/model/login_model.dart';
import 'package:virtual_assistance_2/model/user_model.dart';

import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/utils/show_custom_snackbar.dart';
import 'package:virtual_assistance_2/widgets/custom_button.dart';
import 'package:virtual_assistance_2/widgets/custom_textwidget.dart';
import 'package:virtual_assistance_2/widgets/myform_field.dart';
import 'reset_password.dart'; // Import ResetPassword screen

class LoginScreen extends StatelessWidget {
  bool _obscureText = true;

  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const CustomTextWidget(
                  text: "Let's Sign you in ",
                  size: 22,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: "Welcome Back",
                  size: 14,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                MyformField(
                  hintText: "Email",
                  controller: emailcontroller,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => emailcontroller.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 10),
                MyformField(
                  hintText: "Password",
                  controller: passwordcontroller,
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _obscureText = !_obscureText;
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Login",
                  ontap: () async {
                    AuthController.instance.login(emailcontroller.text.trim(),
                        passwordcontroller.text.trim());
                  },
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigate to the reset password screen
                    Get.to(ResetPassword());
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account yet? "),
                    TextButton(
                      onPressed: () {
                        // Navigate to the signup screen
                        Get.to(() => SignupScreen());
                      },
                      child: const Text(
                        "Register here",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
