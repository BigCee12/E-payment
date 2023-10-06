//import 'package:epaymment/screens/dashboard/my_cards/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/my_cards/card_details.dart';
import 'package:epaymment/screens/dashboard/my_cards/cards_model/card_widget_model.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyCards extends StatefulWidget {
  const MyCards({super.key});

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {

  final formatter = DateFormat.yM();

  List<RowItem> cardItems = [
    RowItem(
      imagePath: "assets/images/cards.jpg",
      name: "Charles Ejikeme Okechukwu",
      accountNumber: '3123477559',
      cvvNumber: "1234",
    ),
    RowItem(
      imagePath: "assets/images/cards.jpg",
      name: "Jane Smith",
      accountNumber: '3123477559',
      cvvNumber: "1334",
    ),
  ];


  Future<void> _showAddCardDialog(BuildContext context) async {
    TextEditingController nameController = TextEditingController();
    TextEditingController accountNumberController = TextEditingController();
    TextEditingController cvvController = TextEditingController();

    @override
    void dispose() {
      nameController.dispose();
      accountNumberController.dispose();
      cvvController.dispose();
      super.dispose();
    }

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text(
              "Add New Card",
              style: TextStyle(
                color: CustomColors.elevatedButtons,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(color: CustomColors.elevatedButtons),
                  ),
                ),
                TextFormField(
                  controller: accountNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Account Number",
                    labelStyle: TextStyle(color: CustomColors.elevatedButtons),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cvvController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  decoration: const InputDecoration(
                    labelText: "CVV",
                    labelStyle: TextStyle(color: CustomColors.elevatedButtons),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Expiry Date"),
                    IconButton(
                      onPressed: () {
                        print("Work on this expiry later.");
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DatePickerSection()));
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: CustomColors.textColor,
                  backgroundColor: CustomColors.elevatedButtons,
                ),
                onPressed: () {
                  if (nameController.text.isEmpty ||
                      accountNumberController.text.isEmpty ||
                      cvvController.text.isEmpty) {
                    // Show a message to tell the user to fill in all fields
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Incomplete Information",
                            style: TextStyle(
                              color: CustomColors.elevatedButtons,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Text(
                            "Please fill in all fields before adding a new card.",
                            style: TextStyle(
                              color: CustomColors.elevatedButtons,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Close the inner dialog
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(
                                  color: CustomColors.elevatedButtons,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // All fields are filled, add the new card item to the cardItems list
                    setState(() {
                      cardItems.add(
                        RowItem(
                          imagePath: "assets/images/cards.jpg",
                          name: nameController.text,
                          accountNumber: accountNumberController.text,
                          cvvNumber: cvvController.text,
                          
                        ),
                      );
                    });
                    Navigator.of(context).pop(); // Close the outer dialog
                  }
                },
                child: const Text("Add",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CustomColors.textColor,
                    )),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the outer dialog
              },
              child: const Text(
                "Cancel",
                softWrap: true,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            const Center(
              child: Text(
                "My Bank",
                style: TextStyle(
                  color: CustomColors.elevatedButtons,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: cardItems.map((item) {
                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.startToEnd,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CardDetailScreen(rowItem: item),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                item.imagePath,
                                width: 70,
                                height: 90,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    color: CustomColors.elevatedButtons,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  item.accountNumber,
                                  style: const TextStyle(
                                    color: CustomColors.elevatedButtons,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "CVV: ${item.cvvNumber}",
                                  style: const TextStyle(
                                    color: CustomColors.elevatedButtons,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.containerBG,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.only(left: 20),
              width: 350,
              height: 70,
              child: GestureDetector(
                onTap: () {
                  _showAddCardDialog(context); // Show the "Add new bank" dialog
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.other_houses_outlined,
                      size: 30,
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Add new bank",
                      style: TextStyle(
                        color: CustomColors.elevatedButtons,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_right_outlined,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
