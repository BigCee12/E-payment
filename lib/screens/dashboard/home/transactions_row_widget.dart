import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class TransactionsRowWidget extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final String amount;

  const TransactionsRowWidget({super.key, 
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 30,
        ),
        const SizedBox(width: 10), // Adjust spacing as needed
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(subtitle),
          ],
        ),
        const Spacer(),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 16,
            color:CustomColors.elevatedButtons, // Customize text color as needed
          ),
        ),
      ],
    );
  }
}
