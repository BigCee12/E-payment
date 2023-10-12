import 'package:country_picker/country_picker.dart';
import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/registration/reasons_for_smartpay/components/reasons_main.dart';
import 'package:flutter/material.dart';

class CountryPickerScreen extends StatefulWidget {
  const CountryPickerScreen({super.key});
  @override
  CountryPickerScreenState createState() => CountryPickerScreenState();
}

class CountryPickerScreenState extends State<CountryPickerScreen> {
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Country of Residence',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please select all the countries that you\'re a tax resident in.',
              style: TextStyle(
                fontSize: 15,
                color: CustomColors.firstSlideTextColors,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 400,
              height: 60,

              child: ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    showPhoneCode: false,
                    onSelect: (Country country) {
                      setState(() {
                        selectedCountry = country;
                      });
                    },
                  );
                },
                child: Text(selectedCountry != null
                    ? selectedCountry!.displayName
                    : 'Choose Country'),
              ),
            ),
            const Spacer(), 
            RoundButton(
                press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReasonsScreen(),
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
