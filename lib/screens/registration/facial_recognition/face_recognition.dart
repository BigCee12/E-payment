import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/registration/facial_recognition/camera_config/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FaceRecognitionWidget extends StatelessWidget {
  const FaceRecognitionWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lets verify your identity",
                    style: TextStyle(
                      fontSize: 30,
                      color: CustomColors.elevatedButtons,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "We're required by law to veify your identity before we can use your money.",
                    style: TextStyle(
                      fontSize: 15,
                      color: CustomColors.elevatedButtons,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: Lottie.asset(
                        'assets/animations/face_scan_animation.json',
                        height: 200,
                        width: 200),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: CustomColors.textColor,
                  backgroundColor: CustomColors.elevatedButtons,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraApp(),
                    ),
                  );
                },
                child: const Text(
                  "Verify Identity",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
