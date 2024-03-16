import 'package:flutter/material.dart';
import 'package:virtual_assistance_2/utils/colors.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String text;
  const CustomButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          //width: 350,
          decoration: BoxDecoration(
              color: Pallete.secondSuggestionBoxColor,
              borderRadius: BorderRadius.circular(5),
              //boxShadow: CustomboxShadow,
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
              )),
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 24,
                color: Pallete.blackColor,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
