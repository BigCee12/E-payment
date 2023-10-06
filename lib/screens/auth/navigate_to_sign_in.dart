import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/auth/signin_user.dart';

import 'package:flutter/material.dart';

class SignInRow extends StatelessWidget {
  const SignInRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          style: TextStyle(
            fontSize: 16,
            color: CustomColors.signUpTextColor,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignIn(),
              ),
            );
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontSize: 18,
              color: CustomColors
                  .textButtonColor, // You can change the button text color
            ),
          ),
        ),
      ],
    );
  }
}
