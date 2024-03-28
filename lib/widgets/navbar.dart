import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_assistance_2/Screens/authentication/login_screen.dart';
import 'package:virtual_assistance_2/Screens/otherScreens/account_screem.dart';
import 'package:virtual_assistance_2/controllers/auth_controller_firebase.dart';

import 'package:virtual_assistance_2/utils/colors.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Kennedy Mutugi Julius"),
            accountEmail: Text("kennedymutugi@111"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/chatperson.png"),
            ),
            decoration: BoxDecoration(
              color: Pallete.firstSuggestionBoxColor,
              image: DecorationImage(
                image: AssetImage("assets/chatperson.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.share),
          //   title: Text("Share"),
          //   onTap: () {
          //     Get.snackbar("Alert Message", "Share to others Comming Soon");
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Counselor Details"),
            onTap: () {
              Get.to(AccountScreen());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {
              AuthController.instance.logOut();
              Get.to(LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
