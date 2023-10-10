import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/auth/third_party_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:flutter_share/flutter_share.dart';

class ReferralCodeWidget extends StatefulWidget {
  const ReferralCodeWidget({Key? key}) : super(key: key);

  @override
  State<ReferralCodeWidget> createState() => _ReferralCodeWidgetState();
}

class _ReferralCodeWidgetState extends State<ReferralCodeWidget> {
  String referralCode = ''; // Declare the referral code variable

  // Function to generate a random referral code
  String generateRandomReferralCode() {
    const codeLength = 10;
    const String characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final Random random = Random.secure();

    String code = '';

    for (int i = 0; i < codeLength; i++) {
      final int randomIndex = random.nextInt(characters.length);
      code += characters[randomIndex];
    }

    return code;
  }

  @override
  void initState() {
    super.initState();
    // Generate the referral code when the widget is initialized
    referralCode = generateRandomReferralCode();
  }

  void _copyTextToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    // Show a snackbar to indicate that the text has been copied.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text copied to clipboard.'),
      ),
    );
  }

  Future<void> shareReferralCode(String refCode) async {
    await FlutterShare.share(
      title: refCode,
      text: refCode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/1696932759462.jpg',
                height: 200,
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Here's \$20 free on us!",
                  style: TextStyle(
                    fontSize: 30,
                    color: CustomColors.elevatedButtons,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                'Share your referral link and earn \n \$20 ',
                style: TextStyle(
                  fontSize: 15,
                  color: CustomColors.firstSlideTextColors,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: CustomColors.containerBG,
                  borderRadius: BorderRadiusDirectional.all(
                    Radius.circular(14),
                  ),
                ),
                width: 350,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 6,
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      onPressed: () {
                        _copyTextToClipboard(
                            referralCode); // Copy the referral code
                      },
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    Text(referralCode), // Display the referral code
                    const Spacer(),
                    TextButton(
                      onPressed: () async {
                        await shareReferralCode(
                            "This is my referral code at E-Payment,use this code to register and earn 20\$, the code is: $referralCode");
                      },
                      child: const Text(
                        "Share",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.elevatedButtons,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Get \$3 free",
                style: TextStyle(
                  fontSize: 30,
                  color: CustomColors.elevatedButtons,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'For any account you connect',
                style: TextStyle(
                  fontSize: 15,
                  color: CustomColors.firstSlideTextColors,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 60,),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child:  Row(
                  children: [
                    GoogleOrAppleLogin(icon: Icons.touch_app),
                    SizedBox(
                      width: 20,
                    ),
                    GoogleOrAppleLogin(icon: Icons.ios_share),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
