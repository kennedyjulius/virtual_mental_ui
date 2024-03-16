// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:virtual_assistance_2/Screens/authentication/reset_password.dart';
import 'package:virtual_assistance_2/Screens/authentication/signup_screen.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/custom_button.dart';
import 'package:virtual_assistance_2/widgets/custom_textwidget.dart';
import 'package:virtual_assistance_2/widgets/myform_field.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  bool _obsecureText = true;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        actions: [TextButton(onPressed: () {}, child: Text("Login ..."))],
      ),
      backgroundColor: Pallete.whiteColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/virtualAssistant.png"))),
              ),
              // CustomTextWidget(
              //     text: "We missed you ",
              //     size: 22,
              //     color: Pallete.mainFontColor,
              //     fontWeight: FontWeight.bold),
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     children: [
              //       CustomTextWidget(
              //           text: "Welcome back",
              //           size: 17,
              //           color: Pallete.mainFontColor,
              //           fontWeight: FontWeight.bold),
              //       SizedBox(
              //         width: 30,
              //       ),
              //       // SizedBox(
              //       //   height: 30,
              //       //   width: 30,
              //       //   child: Image.asset("assets/star.gif"),
              //       // ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),

              MyformField(
                //labelText: "email",
                hintText: "Username",
                controller: emailcontroller,
                obscureText: false,
                suffixIcon: IconButton(
                    onPressed: () {
                      usernamecontroller.clear();
                    },
                    icon: Icon(Icons.clear)),
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(
                height: 10,
              ),

              MyformField(
                //labelText: "email",
                hintText: "email address",
                controller: emailcontroller,
                obscureText: false,
                suffixIcon: IconButton(
                    onPressed: () {
                      emailcontroller.clear();
                    },
                    icon: Icon(Icons.clear)),
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(
                height: 10,
              ),

              //password field
              MyformField(
                //labelText: "password",
                hintText: "Enter Password",
                controller: passwordcontroller,
                obscureText: _obsecureText,
                suffixIcon: IconButton(
                    onPressed: () {
                      _obsecureText = !_obsecureText;
                    },
                    icon: Icon(_obsecureText
                        ? Icons.visibility_off
                        : Icons.visibility)),
                prefixIcon: Icon(Icons.password),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                      text: "Forgot your",
                      size: 17,
                      color: Pallete.blackColor,
                      fontWeight: FontWeight.bold),
                  TextButton(
                    onPressed: () {
                      Get.to(ResetPassword());
                    },
                    child: Text("Username?"),
                  ),
                  CustomTextWidget(
                      text: "/",
                      size: 17,
                      color: Pallete.mainFontColor,
                      fontWeight: FontWeight.bold),
                  TextButton(
                    onPressed: () {
                      Get.to(ResetPassword());
                    },
                    child: Text("Password?"),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              // TextButton(onPressed: () {

              // }, child: Text("Forgot Password? ...")
              // ),
              // SizedBox(height: 10,),

              //custom button
              CustomButton(
                text: "Login",
                ontap: () {
                  //AuthController.instance.login(emailcontroller.text.trim(), passwordcontroller.text.trim());
                },
              ),

              // Row(
              //   children: [
              //     CustomTextWidget(
              //         text: "Don't have account yet ?",
              //         size: 14,
              //         color: Pallete.mainFontColor,
              //         fontWeight: FontWeight.w200),
              //     SizedBox(
              //       width: 2,
              //     ),
              //     TextButton(
              //         onPressed: () {
              //           Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => SignupScreen(),
              //           ));
              //         },
              //         child: Text("Register here...")
              //         ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
