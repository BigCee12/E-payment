import 'package:epaymment/components/custom_button.dart';

import 'package:epaymment/screens/registration/facial_recognition/face_recognition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Set your PIN code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "We use state-of-the-art security measures to protect your information at all times.",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 60.0),
            OtpTextField(
              numberOfFields: 5,
              borderColor: const Color(0xFF512DA8),
              // Set to true to show as a box or false to show as a dash
              showFieldAsBox: true,
              // Runs when a code is typed in
              onCodeChanged: (String code) {
                // Handle validation or checks here
              },
              // Runs when every text field is filled
              onSubmit: (String verificationCode) {
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return AlertDialog(
                //       title: const Text("Verification Code"),
                //       content: Text('Code entered is $verificationCode'),
                //     );
                //   },
                // );
              }, // End onSubmit
            ),
            const SizedBox(
              height: 50,
            ),
            
               RoundButton(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaceRecognitionWidget(),
                    ),
                  );
                },
                title: 'Continue',
              ),
            
          ],
        ),
      ),
    );
  }
}
