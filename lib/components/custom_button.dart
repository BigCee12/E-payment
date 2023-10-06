import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatefulWidget {
  final String? title;
  final Function() press;
  const RoundButton({super.key, this.title = "Submit", required this.press});

  @override
  State<RoundButton> createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: CustomColors.textColor,
          backgroundColor: CustomColors.elevatedButtons,
        ),
        onPressed: widget.press,
        child: Text(
          widget.title.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColors.textColor,
          ),
        ),
      ),
    );
  }
}
