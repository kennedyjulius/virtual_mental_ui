import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/controllers/auth_controller_firebase.dart';

import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/utils/show_custom_snackbar.dart';
import 'package:virtual_assistance_2/widgets/custom_button.dart';
import 'package:virtual_assistance_2/widgets/custom_textwidget.dart';
import 'package:virtual_assistance_2/widgets/myform_field.dart';
import 'package:virtual_assistance_2/widgets/socials_buttons.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController= TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  bool _obscurePassword = true;

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
                  text: "Let's Register ",
                  size: 22,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: "Account,",
                  size: 22,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: "Hello user, you have a great journey waiting for you,",
                  size: 14,
                  color: Pallete.mainFontColor,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 5),
                const Center(
                  child: CustomTextWidget(
                    text: "Get started now!",
                    size: 14,
                    color: Pallete.secondSuggestionBoxColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                MyformField(
                  hintText: "Name",
                  controller: usernameController,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => usernameController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(height: 10),
                MyformField(
                  hintText: "Email",
                  controller: emailController,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => emailController.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
                const SizedBox(height: 10),
                MyformField(
                  hintText: "Password",
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _obscurePassword = !_obscurePassword;
                    },
                    icon: Icon(
                      // ignore: dead_code
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyformField(
                  hintText: "Confirm Password",
                  controller: confirmpasswordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _obscurePassword = !_obscurePassword;
                    },
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Signup",
                  ontap: () async {
                    AuthController.instance.register(
                    usernameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim());
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SocialsCustom(child: Image.asset("assets/linkedin.png")),
                    const SizedBox(width: 5),
                    SocialsCustom(child: Image.asset("assets/github.png")),
                    const SizedBox(width: 5),
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
