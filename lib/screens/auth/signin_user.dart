import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/auth/navigate_to_signup.dart';
import 'package:epaymment/screens/auth/third_party_login.dart';
import 'package:flutter/material.dart';
import 'package:epaymment/screens/auth/divider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  LoginAppState createState() => LoginAppState();
}

class LoginAppState extends State<SignIn> {
  bool _isPasswordVisible = false; // Initially, the password is obscured

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible; // Toggle the visibility state
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hi There! 👋',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Welcome back, Sign in to your account.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Colors
                              .transparent), // Set border color to transparent
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                          color: Colors
                              .transparent), // Set border color to transparent
                    ),
                    filled: true, // Fill the background
                    fillColor: CustomColors.containerBG,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText:
                      !_isPasswordVisible, // Toggle password visibility
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility, // Call the method
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                          color: Colors
                              .transparent), // Set border color to transparent
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: const BorderSide(
                          color: Colors
                              .transparent), // Set border color to transparent
                    ),
                    filled: true, // Fill the background
                    fillColor: CustomColors.containerBG,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Forgot Password action
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: CustomColors.textColor,
                      backgroundColor: CustomColors.elevatedButtons,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: CustomColors.textColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const HorizontalDividerWithText(),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    GoogleOrAppleLogin(icon: Icons.touch_app),
                    SizedBox(
                      width: 20,
                    ),
                    GoogleOrAppleLogin(icon: Icons.ios_share),
                  ],
                ),
                const SizedBox(height: 90,),
                const SignUpRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
