import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class ReasonOption extends StatefulWidget {
  final IconData icon;
  final String text;

  const ReasonOption({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  ReasonOptionState createState() => ReasonOptionState();
}

class ReasonOptionState extends State<ReasonOption> {
  bool isSelected = false;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleSelection,
      child: Container(
        height: 100,
        width: 160,
        decoration: BoxDecoration(
          border: Border.all(style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10.0),
          color: isSelected
              ? const Color.fromARGB(255, 60, 95, 61)
              : CustomColors.textColor,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Icon(
              widget.icon,
              color: isSelected ? CustomColors.textColor : Colors.black,
              size: 25,
            ),
            const SizedBox(height: 14.0),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 20,
                color: isSelected ? CustomColors.textColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
