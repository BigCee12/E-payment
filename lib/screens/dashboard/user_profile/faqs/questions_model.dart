import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class FAQSModel extends StatelessWidget {
  final String mainText;
  final String subTitle;
  const FAQSModel({super.key, required this.mainText, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(
                255, 109, 102, 102), // Set the border color
            width: 1.0, // Set the border width
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.elevatedButtons,
                    fontSize: 20),
              ),
              Text(
                subTitle,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.textElevatedColors,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
