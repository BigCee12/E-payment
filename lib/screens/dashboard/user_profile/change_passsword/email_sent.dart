import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:flutter/material.dart';

class EmailSent extends StatefulWidget {
  const EmailSent({super.key});

  @override
  State<EmailSent> createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/1697118985681.jpg",
                height: 100,
                width: 80,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Please check in your email and get the password.",
                style: TextStyle(
                  color: CustomColors.textElevatedColors,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              RoundButton(
                press: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                title: "Done",
              )
            ],
          ),
        ));
  }
}
