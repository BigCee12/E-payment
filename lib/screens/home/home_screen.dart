import 'package:flutter/material.dart';
//import 'package:epaymment/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
         Colors.deepPurple, // Mixture of blue and orange
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loading_icon.png', // Replace with the path to your image
              height: 100, // Adjust the height as needed
            ),
           const SizedBox(height: 5), // 5 pixels of space
           const Text(
              'E.Payment',
              style: TextStyle(fontSize: 40, color: Color.fromARGB(255, 14, 13, 61), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
