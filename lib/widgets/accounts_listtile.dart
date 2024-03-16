import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  //final String subtitle;
  final Color color;
  final IconData icon;
  final Widget trailingIcon;
  final VoidCallback ontap;

  const CustomListTile({
    Key? key,
    required this.title,
    //required this.subtitle,
    required this.color,
    required this.icon,
    required this.trailingIcon,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue.shade200,
            style: BorderStyle.solid
          )
        ),
        child: ListTile(
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
              border: Border.all(
                color: Colors.purple.shade100.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: Icon(icon),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          // subtitle: Text(
          //   subtitle,
          //   style: TextStyle(
          //       color: Colors.lightBlue.shade200,
          //       fontWeight: FontWeight.w300,
          //       fontSize: 12),
          // ),
          trailing: trailingIcon,
        ),
      ),
    );
  }
}
