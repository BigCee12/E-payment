import 'package:flutter/material.dart';
import 'package:epaymment/constants/colors.dart';
//import 'package:google_fonts/google_fonts.dart';

class SecondHomeSlideScreen extends StatelessWidget {
  const SecondHomeSlideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/second_page.png',
                    height: 400,
                  ),
                  const SizedBox(height: 60),
                  const Text(
                    'Finance app the fastest \n and most trusted',
                    style: TextStyle(
                      fontSize: 30,
                      color: CustomColors.elevatedButtons,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Your finance work starts here. We'er here to help you \n track and deal with speeding up your transactions",
                    style: TextStyle(
                      fontSize: 15,
                      color: CustomColors.firstSlideTextColors,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
