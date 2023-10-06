import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/screens/registration/cards/choose_card.dart';
import 'package:flutter/material.dart';
import 'package:epaymment/constants/colors.dart';
//import 'package:google_fonts/google_fonts.dart';

class GetFreeCard extends StatelessWidget {
  const GetFreeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cards.jpg',
                      height: 400,
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      'Create your Smartpay Card',
                      style: TextStyle(
                        fontSize: 30,
                        color: CustomColors.elevatedButtons,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "The customizable, no hidden fee, instant discount debit \n or credit card.",
                      style: TextStyle(
                        fontSize: 15,
                        color: CustomColors.firstSlideTextColors,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    RoundButton(
                        title: "Get Free  Card",
                        press: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FullScreenImageWidget()),
                          );
                        })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
