import 'package:country_picker/country_picker.dart';
import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/screens/dashboard/home/home_dashboard.dart';
import 'package:epaymment/screens/registration/cards/new_card/card_expiry_date.dart';
import 'package:epaymment/screens/registration/cards/new_card/card_number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThreeIconButtonsWidget extends StatefulWidget {
  const ThreeIconButtonsWidget({Key? key}) : super(key: key);
  @override
  ThreeIconButtonsWidgetState createState() => ThreeIconButtonsWidgetState();
}

class ThreeIconButtonsWidgetState extends State<ThreeIconButtonsWidget> {
  int selectedIconIndex = -1; // -1 means none selected
  String defaultImage = "assets/images/card_1.jpg";
  Country? selectedCountry;
  final TextEditingController _expiryDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _expiryDateController.addListener(_formatExpiryDate);
  }

  void _formatExpiryDate() {
    final text = _expiryDateController.text;
    if (text.length == 2 && !text.contains('/')) {
      // User typed 2 numbers, add a '/' after them
      _expiryDateController.text = '$text/';
      _expiryDateController.selection = TextSelection.fromPosition(
        TextPosition(offset: _expiryDateController.text.length),
      );
    } else if (text.length == 3 && text.endsWith('/')) {
      // User typed the first digit after '/', do nothing
    } else if (text.length == 5) {
      // Limit the input to MM/YY format (5 characters)
      _expiryDateController.text = text.substring(0, 5);
      _expiryDateController.selection = TextSelection.fromPosition(
        TextPosition(offset: _expiryDateController.text.length),
      );
    }
  }

  @override
  void dispose() {
    _expiryDateController.dispose();
    super.dispose();
  }

  void _handleIconButtonTap(int index) {
    setState(() {
      if (selectedIconIndex == index) {
        // Untoggle if the same icon is tapped again
        selectedIconIndex = -1;
        defaultImage = "assets/images/card_1.jpg"; // Restore the default image
      } else {
        selectedIconIndex = index;
        // Set the corresponding image based on the selected index
        switch (index) {
          case 0:
            defaultImage = "assets/images/card_1.jpg";
            break;
          case 1:
            defaultImage = "assets/images/card_2.jpg";
            break;
          case 2:
            defaultImage = "assets/images/card_3.jpg";
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(4), // Adjust the top padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: 600, // Increase the height for a bigger image
              child: Container(
                alignment: Alignment.topCenter, // Center the content
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center the row
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: AssetImage(defaultImage),
                            fit: BoxFit
                                .contain, // Use BoxFit.contain for a contained image
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50, // Add spacing between the image and icons
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCircularIconButton(
                            icon: Icons.add,
                            color: const Color.fromARGB(255, 145, 113, 71),
                            index: 0,
                          ),
                          _buildCircularIconButton(
                            icon: Icons.edit,
                            color: Colors.blue.shade400,
                            index: 1,
                          ),
                          _buildCircularIconButton(
                            icon: Icons.delete,
                            color: Colors.green,
                            index: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30), // SizedBox with a height of 20
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Card Detail",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberInputFormatter() // Limit to 4 characters (MM/YY)
                    ],
                    decoration: InputDecoration(
                      hintText: 'Card Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(
                        child: CardExpiryInput(), // Use the custom widget
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(
                                3), // Limit to 5 characters (MM/YY)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'CVV',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Card Holder',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
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
                  const SizedBox(height: 100),
                  RoundButton(
                    title: "Save",
                    press: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog.adaptive(
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeDashboard()));
                                    },
                                    child: const Text("Ok, I'm ready"))
                              ],
                              content: const Text(
                                  "Now you can shop, transmit and transfer \n continentally,"),
                              title: const Text("Great your card is ready"),
                              icon: const Icon(
                                  Icons.account_balance_wallet_outlined),
                            );
                          });
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

  Widget _buildCircularIconButton({
    required IconData icon,
    required Color color,
    required int index,
  }) {
    bool isSelected = selectedIconIndex == index;
    return GestureDetector(
      onTap: () {
        _handleIconButtonTap(index);
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.5) : null,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            size: 20,
            isSelected ? Icons.check : icon,
            color: isSelected ? Colors.green : Colors.black,
          ),
        ),
      ),
    );
  }
}
