import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class HorizontalDividerWithText extends StatelessWidget {
  const HorizontalDividerWithText({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Divider(
            color: CustomColors.dividerColor, // Color of the line
            thickness: 1, // Thickness of the line
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 12), // Adjust the spacing as needed
          child: Text(
            'OR',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
          ),
        ),
        Expanded(
          child: Divider(
            color: CustomColors.dividerColor, // Color of the line
            thickness: 1, // Thickness of the line
          ),
        ),
      ],
    );
  }
}
