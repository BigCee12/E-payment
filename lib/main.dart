import 'package:camera/camera.dart';
import 'package:epaymment/screens/home/first_home_slide_navigation.dart';
import 'package:epaymment/screens/registration/facial_recognition/camera_config/camera_screen.dart';

import 'package:flutter/material.dart';
import 'package:epaymment/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _mockInitialization() async {
    await Future.delayed(
        const Duration(seconds: 4)); // Simulate a 2-second delay
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();

      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<void>(
          future: _mockInitialization(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // Once the Future completes, transition to the main content
              return const HomeSlideScreen();
            } else {
              // While the Future is loading, show the loading screen
              return const HomeScreen();
            }
          },
        ),
      ),
    );
  }
}
