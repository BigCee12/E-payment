import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class GeneralSettingsModel extends StatefulWidget {
  const GeneralSettingsModel(
      {super.key,
      required this.title,
      required this.subtext,
      required this.subtitle});
  final String title;
  final String subtext;
  final String subtitle;

  @override
  State<GeneralSettingsModel> createState() => _GeneralSettingsModelState();
}

class _GeneralSettingsModelState extends State<GeneralSettingsModel> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            widget.title.toString(),
            style: const TextStyle(
              color: CustomColors.elevatedButtons,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
           Text(
            widget.subtext.toString(),
            style: const TextStyle(
              color: CustomColors.dividerColor,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
           Text(
            widget.subtitle.toString(),
            style: const TextStyle(
              color: CustomColors.dividerColor,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            ),
          ),
        ]),
       const Spacer(),
         Switch(
          activeColor: CustomColors.textColor,
          activeTrackColor: CustomColors.elevatedButtons,
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ],
    );
  }
}
