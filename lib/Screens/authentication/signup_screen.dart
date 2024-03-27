// ignore_for_file: prefer_const_constructors

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
import 'package:virtual_assistance_2/widgets/socials_buttons.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  SignupScreen({Key? key}) : super(key: key);

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
                  text: "Let's Register ",
                  size: 22,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                CustomTextWidget(
                  text: "Account,",
                  size: 22,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                CustomTextWidget(
                  text: "Hello user, you have a great journey waiting for you,",
                  size: 14,
                  color: Pallete.mainFontColor,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 5),
                Center(
                  child: CustomTextWidget(
                    text: "Get started now!",
                    size: 14,
                    color: Pallete.secondSuggestionBoxColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                MyformField(
                  hintText: "Name",
                  controller: usernameController,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => usernameController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: 10),
                MyformField(
                  hintText: "Email",
                  controller: emailController,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => emailController.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                SizedBox(height: 10),
                MyformField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureText = !obscureText;
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "Signup",
                  ontap: () async {
                    String username = usernameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (username.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty) {
                      UserModel? user = await AuthController.to
                          .registration(username, email, password, password);
                      if (user != null) {
                        showCustomSnackBar("Registered successfull", title: "Success, ", backgroundColor: Colors.green);
                        Get.to(HomeScreen());
                      }
                    } else {
                      showCustomSnackBar("Please fill all fields",
                          title: "Error", backgroundColor: Colors.red);
                    }
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Pallete.secondSuggestionBoxColor,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey)),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialsCustom(child: Image.asset("assets/linkedin.png")),
                    SizedBox(width: 5),
                    SocialsCustom(child: Image.asset("assets/github.png")),
                    SizedBox(width: 5),
                    SocialsCustom(child: Image.asset("assets/ig.png")),
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
