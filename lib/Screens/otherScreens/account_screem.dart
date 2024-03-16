// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:virtual_assistance_2/utils/colors.dart';
import 'package:virtual_assistance_2/widgets/accounts_listtile.dart';
import 'package:virtual_assistance_2/widgets/custom_textwidget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Pallete.firstSuggestionBoxColor,
            ),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage("assets/virtualAssistance.png"),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                    text: "@marvinmc",
                    size: 14,
                    color: Colors.black12,
                    fontWeight: FontWeight.w100)
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
                child: Container(
                  child: Column(
                    children: [
                      CustomListTile(
                        title: "Edit Profile",
                        color: Pallete.secondSuggestionBoxColor,
                        icon: Icons.person_2,
                        trailingIcon: Icon(Icons.arrow_forward_ios),
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomListTile(
                        title: "Settings",
                        color: Pallete.secondSuggestionBoxColor,
                        icon: Icons.settings,
                        trailingIcon: Icon(Icons.arrow_forward_ios),
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomListTile(
                        title: "Privacy",
                        color: Pallete.secondSuggestionBoxColor,
                        icon: Icons.privacy_tip,
                        trailingIcon: Icon(Icons.arrow_forward_ios),
                        ontap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomListTile(
                        title: "Log Out",
                        color: Pallete.thirdSuggestionBoxColor,
                        icon: Icons.logout_rounded,
                        trailingIcon: Icon(Icons.arrow_forward_ios),
                        ontap: () {},
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // CustomListTile(
                      //   title: "Edit Profile",
                      //   color: Pallete.secondSuggestionBoxColor,
                      //   icon: Icons.person_2,
                      //   trailingIcon: Icon(Icons.arrow_forward_ios),
                      //   ontap: () {},
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
