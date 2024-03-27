import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/home_screen.dart';
import 'package:virtual_assistance_2/controllers/authentication_controller.dart';
import 'package:virtual_assistance_2/model/registration_model.dart';
import 'package:virtual_assistance_2/model/user_model.dart';
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
  var emailController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;
    bool obscureConfirmPassword = true;

    Future<UserModel> _registration() async {
      var authController = Get.find<AuthController>();

      String email = emailController.text.trim();
      String name = usernameController.text.trim();
      String password = passwordController.text.trim();
      String passwordConfirm = confirmPasswordController.text.trim();

      if (email.isEmpty) {
        showCustomSnackBar("Enter Email", title: "Email");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar("Enter a valid Email", title: "Email");
      } else if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in password", title: "Password");
      } else if (password != passwordConfirm) {
        showCustomSnackBar("password didn't match", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("password should't be less than 6 characters",
            title: "Password");
      } else {
        RegisterUser registerUser = RegisterUser(
          email: email,
          name: name,
          password: password,
          passwordConfirm: passwordConfirm,
        );
        var userModel = await authController.registration(registerUser);
        print(userModel);
      }
      return UserModel.empty();
    }

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
                  obscureText: obscurePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscurePassword = !obscurePassword;
                    },
                    icon: Icon(
                      // ignore: dead_code
                      obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyformField(
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                  obscureText: obscureConfirmPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      obscureConfirmPassword = !obscureConfirmPassword;
                    },
                    icon: Icon(
                      obscureConfirmPassword
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
                    var user = await _registration();
                    if (user != null) {
                      Get.to(const HomeScreen());
                      showCustomSnackBar("Registration Successfull",
                          backgroundColor: Colors.green, title: "success");
                    } else {
                      showCustomSnackBar("Email or Username already taken");
                    }
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
