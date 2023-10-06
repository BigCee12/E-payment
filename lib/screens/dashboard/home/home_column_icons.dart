import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final double iconSize;

  const IconTextWidget({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
    this.iconSize = 27.0, // Default size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(color:CustomColors.elevatedButtons,
            iconData,
            size: iconSize,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 16,color: CustomColors.elevatedButtons),
          ),
        ],
      ),
    );
  }
}
