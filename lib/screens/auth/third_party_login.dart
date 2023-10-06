import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class GoogleOrAppleLogin extends StatelessWidget {
  final IconData icon;
  const GoogleOrAppleLogin({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 170,
        height: 80,
        decoration: BoxDecoration(
          color: CustomColors.containerBG,
          borderRadius: BorderRadius.circular(18),
        ), // Background color of the container
        child:  Center(
          child: Icon(
            icon, // The clickable icon
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
