import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/faqs/questions_model.dart';
import 'package:flutter/material.dart';

class FAQS extends StatefulWidget {
  const FAQS({super.key});

  @override
  State<FAQS> createState() => _FAQsState();
}

class _FAQsState extends State<FAQS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "You have any question ?",
              style: TextStyle(
                color: CustomColors.elevatedButtons,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                label: const Text(
                  'Search',
                  style: TextStyle(
                    color: CustomColors.elevatedButtons,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.transparent),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
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
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Frequently Asked",
                  style: TextStyle(
                    color: CustomColors.textElevatedColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                Text(
                  "View All",
                  style: TextStyle(
                    color: CustomColors.textElevatedColors,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            const FAQSModel(
              mainText: "How do I create a Smartpay acount?",
              subTitle:
                  "You can create a Smartpay account by downloading and opening \nthe SmartPay application first then select....",
            ),
            const FAQSModel(
              mainText: "How to create with Smartpay?",
              subTitle:
                  "You can select the create card menu then select the 'Add New\nCard select the continue button then you......",
            ),
            const FAQSModel(
              mainText: "How to Top Up on Smartpay",
              subTitle:
                  "Click the Top Up menu then select the amount of monthly and\nthe method then clikc the 'Top up now' button....",
            ),
            const Spacer(),
            RoundButton(press: () {}, title: "Load More")
          ],
        ),
      ),
    );
  }
}
