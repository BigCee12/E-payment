// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:epaymment/screens/dashboard/user_profile/account_info/account_info_model/accout_info_model.dart';
import 'package:flutter/material.dart';

import 'package:epaymment/constants/colors.dart';

class AccountWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? customSubtitle;

  const AccountWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.customSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: CustomColors.dividerColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null)
            Text(
            subtitle!,
            style: const TextStyle(
              color: CustomColors.elevatedButtons,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
           if (customSubtitle != null) ...[customSubtitle!],
        ],
      ),
    );
  }
}
