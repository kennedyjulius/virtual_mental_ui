import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/authentication/reset_password.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/custom_button.dart';
import 'package:virtual_assistance_2/widgets/custom_textwidget.dart';
import 'package:virtual_assistance_2/widgets/myform_field.dart';
import 'package:virtual_assistance_2/widgets/socials_buttons.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  bool _obsecureText = true;

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 10),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/chatgpt.png"),
                    ),
                  ),
                ),
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
                  controller: usernamecontroller,
                  obscureText: false,
                  suffixIcon: IconButton(
                    onPressed: () => usernamecontroller.clear(),
                    icon: Icon(Icons.clear),
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: 10),
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
                  obscureText: _obsecureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      _obsecureText = !_obsecureText;
                      // Force rebuild to update the obscureText
                      //Get.forceAppUpdate();
                    },
                    icon: Icon(
                      _obsecureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  prefixIcon: Icon(Icons.password),
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "Signup",
                  ontap: () {
                    // Perform signup action
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
                        child: Text("OR", style: TextStyle(color: Pallete.secondSuggestionBoxColor, fontWeight: FontWeight.w200),),
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
