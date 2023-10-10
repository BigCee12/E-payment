import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/registration/signup.dart';
import 'package:flutter/material.dart';

class SignUpRow extends StatelessWidget {
  const SignUpRow({super.key, });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: 16,
            color: CustomColors.signUpTextColor,
          ),
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const  SignUp(),
              ),
            );
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize:18,
              color: CustomColors.textButtonColor, // You can change the button text color
            ),
          ),
        ),
      ],
    );
  }
}
