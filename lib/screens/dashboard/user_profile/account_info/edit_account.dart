import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
// import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/account_info/account_info_model/accout_info_model.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  final AccountInfoModel initialData;

  const EditAccountScreen({
    super.key,
    required this.initialData,
  });

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  late AccountInfoModel updatedData;

  @override
  void initState() {
    super.initState();
    // Initialize the updated data list with the initial data
    updatedData = widget.initialData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Account Info",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: updatedData
                    .toMapDisplay()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 400,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              //color: CustomColors.containerBG,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(key),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
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
                                  initialValue: value,
                                  onChanged: (val) {
                                    Map<String, dynamic> data =
                                        updatedData.toMapDisplay();
                                    data[key] = val;
                                    // Update the data in the updatedData when the user edits
                                    updatedData =
                                        AccountInfoModel.fromMapDisplay(data);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
            RoundButton(
              press: () {
                // Return the updated data list to the previous screen
                Navigator.of(context).pop<AccountInfoModel>(updatedData);
              },
              title: "Save Changes",
            ),
          ],
        ),
      ),
    );
  }
}
