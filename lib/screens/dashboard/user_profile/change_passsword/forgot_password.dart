import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/change_passsword/email_sent.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text(
            "Forget Password",
            style: TextStyle(
              color: CustomColors.elevatedButtons,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text("Enter your email and get the password in your email",
              style: TextStyle(
                  color: Color.fromARGB(255, 58, 48, 48), fontSize: 15)),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              label: const Text(
                'Email',
                style: TextStyle(
                    color: CustomColors.elevatedButtons, fontSize: 16),
              ),
              border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.transparent),
              ),

              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                    color: Colors.transparent), // Set border color to transparent
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                    color: Colors.transparent), // Set border color to transparent
              ),
              filled: true, // Fill the background
              fillColor: CustomColors.containerBG,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          RoundButton(
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EmailSent(),
                ),
              );
            },
            title: "Send Email",
          )
        ],
      ),
    );
  }
}
