import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/change_passsword/forgot_password.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible; // Toggle the visibility state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Change Password",
              style: TextStyle(
                color: CustomColors.elevatedButtons,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Please enter a new password below different from the previous password",
              style: TextStyle(
                  color: Color.fromARGB(255, 58, 48, 48), fontSize: 15),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                label: const Text(
                  'Old Password',
                  style: TextStyle(
                      color: CustomColors.elevatedButtons, fontSize: 14),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),

                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Set border color to transparent
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Set border color to transparent
                ),
                filled: true, // Fill the background
                fillColor: CustomColors.containerBG,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              obscureText: !_isPasswordVisible, // Toggle password visibility
              decoration: InputDecoration(
                label: const Text(
                  'Input Password',
                  style: TextStyle(
                    color: CustomColors.elevatedButtons,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
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
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Set border color to transparent
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Set border color to transparent
                ),
                filled: true, // Fill the background
                fillColor: CustomColors.containerBG,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextField(
              obscureText: !_isPasswordVisible, // Toggle password visibility
              decoration: InputDecoration(
                label: const Text(
                  'Confirm Password',
                  style: TextStyle(
                    color: CustomColors.elevatedButtons,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
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
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Set border color to transparent
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(
                      color: Colors
                          .transparent), // Set border color to transparent
                ),
                filled: true, // Fill the background
                fillColor: CustomColors.containerBG,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ForgetPassword()));
              },
              child: const Text(
                "Forgot Password? ",
                style: TextStyle(color: Colors.cyan),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            RoundButton(
              press: () {},
              title: "Change Password",
            ),
          ],
        ),
      ),
    );
  }
}
