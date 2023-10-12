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
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: SizedBox(
        width: 400,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: CustomColors.textColor,
            backgroundColor: CustomColors.elevatedButtons,
          ),
          onPressed: widget.press,
          child: Text(
            widget.title.toString(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: CustomColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
