
import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/screens/registration/reasons_for_smartpay/components/reasons_to_use_model.dart';
import 'package:epaymment/screens/registration/reasons_for_smartpay/user_pin/pincode.dart';
import 'package:flutter/material.dart';

class ReasonsScreen extends StatefulWidget {
  const ReasonsScreen({super.key});
  @override
  ReasonsScreenState createState() => ReasonsScreenState();
}

class ReasonsScreenState extends State<ReasonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            const Text(
              "Main reason for using SmartPay",
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
            ),
           const  SizedBox(height: 8.0),
            const Text(
              "We need to know this for regulatory \n reasons. And also we're curious!",
              style: TextStyle(fontSize: 16),
            ),
           const  SizedBox(height: 24.0),
           const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReasonOption(
                  icon: Icons.monetization_on,
                  text: "Spend or save",
                ),
                ReasonOption(
                  icon: Icons.shopping_cart,
                  text: "Shopping",
                ),
              ],
            ),
           const  SizedBox(height: 16.0),
           const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReasonOption(
                  icon: Icons.restaurant,
                  text: "Dining",
                ),
                ReasonOption(
                  icon: Icons.home,
                  text: "Home",
                ),
              ],
            ),
           const  SizedBox(height: 16.0),
           const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReasonOption(
                  icon: Icons.directions_car,
                  text: "Travel",
                ),
                ReasonOption(
                  icon: Icons.star,
                  text: "Others",
                ),
              ],
            ),
            const Spacer(),
            
              RoundButton(
                
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PinCodeWidget(),
                    ),
                  );
                },
                title: 'Continue',
              ),
            
          ],
        ),
      ),
    );
  }
}
