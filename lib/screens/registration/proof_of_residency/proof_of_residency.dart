import 'package:country_picker/country_picker.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/registration/cards/get_free_card.dart';
import 'package:flutter/material.dart';

class ProofOfResidencyWidget extends StatefulWidget {
  const ProofOfResidencyWidget({super.key});

  @override
  State<ProofOfResidencyWidget> createState() => _ProofOfResidencyWidgetState();
}

class _ProofOfResidencyWidgetState extends State<ProofOfResidencyWidget> {
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Proof Of Residency",
              style: TextStyle(
                color: CustomColors.boldTextColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Prove you live in the United States.",
              style: TextStyle(
                color: CustomColors.dividerColor,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            const Text(
              "Nationality",
              style: TextStyle(color: CustomColors.dividerColor, fontSize: 20),
            ),
            const SizedBox(
              height: 15.0,
            ),
            SizedBox(
              width: 500,
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
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              "Methods of Verification",
              style: TextStyle(color: CustomColors.dividerColor, fontSize: 20),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildVerificationMethod(
                    icon: Icons.book,
                    title: "Passport",
                    onTap: () {
                      // Handle the tap on the "Passport" item
                      // Navigate to the appropriate route for Passport
                    },
                  ),
                  const Divider(height: 1, color: Colors.grey),
                  _buildVerificationMethod(
                    icon: Icons.credit_card,
                    title: "Identity Card",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const GetFreeCard(),
                        ),
                      );
                    },
                  ),
                  const Divider(height: 1, color: Colors.grey),
                  _buildVerificationMethod(
                    icon: Icons.insert_drive_file,
                    title: "Digital Document",
                    onTap: () {
                      // Handle the tap on the "Digital Document" item
                      // Navigate to the appropriate route for Digital Document
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationMethod(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                color: CustomColors.boldTextColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
