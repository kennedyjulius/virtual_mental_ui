import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/controllers/authentication_controller.dart';
import 'package:virtual_assistance_2/model/user_model.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/utils/show_custom_snackbar.dart';
import 'package:virtual_assistance_2/widgets/custom_button.dart';
import 'package:virtual_assistance_2/widgets/custom_textwidget.dart';
import 'package:virtual_assistance_2/widgets/myform_field.dart';
import 'reset_password.dart'; // Import ResetPassword screen

class LoginScreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool _obscureText = true;

  LoginScreen({Key? key}) : super(key: key);

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
                SizedBox(height: 20),
                CustomTextWidget(
                  text: "Let's Sign you in ",
                  size: 22,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                CustomTextWidget(
                  text: "Welcome Back",
                  size: 14,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 20),
                MyformField(
                  hintText: "Email",
                  controller: emailcontroller,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => emailcontroller.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                SizedBox(height: 10),
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
                  prefixIcon: Icon(Icons.lock),
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "Login",
                  ontap: () async {
                    String email = emailcontroller.text.trim();
                    String password = passwordcontroller.text.trim();
                    if (email.isNotEmpty && password.isNotEmpty) {
                      UserModel? user = await AuthController.to.login(email, password);
                      if (user != null) {
                        //Navigate to the home screen or any other screen
                        Get.to(HomeScreen());
                      }
                    } else {
                      showCustomSnackBar("Please enter email and password",
                          title: "Error", backgroundColor: Colors.red);
                    }
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigate to the reset password screen
                    Get.to(ResetPassword());
                  },
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
