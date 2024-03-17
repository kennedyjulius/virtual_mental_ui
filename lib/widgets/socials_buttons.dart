import 'package:flutter/material.dart';

class SocialsCustom extends StatelessWidget {
  final Widget child;
  const SocialsCustom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white,
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.white10,
          width: 0.5,
        )
      ),
      child: child,
    );
  }
}
