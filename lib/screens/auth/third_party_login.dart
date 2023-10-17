import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class GoogleOrAppleLogin extends StatelessWidget {
  
  final String imagePath;
  const GoogleOrAppleLogin(
      {super.key, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          color: CustomColors.textColor,
          borderRadius: BorderRadius.circular(18),
        ), // Background color of the container
        child: Center(
          child: Image.asset(
            imagePath,
            height: 60,
            width: 70,
          ),
        ),
      ),
    );
  }
}
