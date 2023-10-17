import 'package:epaymment/components/custom_button.dart';
import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/account_info/account_data_row_widget.dart';
import 'package:epaymment/screens/dashboard/user_profile/account_info/account_info_model/accout_info_model.dart';
import 'package:epaymment/screens/dashboard/user_profile/account_info/edit_account.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({
    super.key,
  });

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  bool isSwitched = false;

  AccountInfoModel accountdata = AccountInfoModel(
    name: "Tommy Jason",
    phoneNumber: "1234456646464",
    occupation: "Manager",
    employer: "Overlay Design",
    email: "rechard@gmail.com",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Account Info",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      "assets/images/cards.jpg",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Add your edit profile logic here
                      },
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: CustomColors.textColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Color.fromARGB(255, 62, 52, 52),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Personal Info",
                style: TextStyle(
                  color: CustomColors.dividerColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: 400,
                //padding: const EdgeInsets.symmetric(horizontal:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: CustomColors.dividerColor,
                  ),
                ),
                child: Column(
                  children: [
                    AccountWidget(
                      title: "Your name",
                      subtitle: accountdata.name,
                    ),
                    AccountWidget(
                      title: "Occupation",
                      subtitle: accountdata.occupation,
                    ),
                    AccountWidget(
                      title: "Employer",
                      subtitle: accountdata.employer,
                    ),
                    AccountWidget(
                      title: "U.S Citizen",
                      customSubtitle: Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: CustomColors.elevatedButtons,
                        activeColor: CustomColors.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Text(
                "Contact Info",
                style: TextStyle(
                  color: CustomColors.dividerColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: 400,
                //padding: const EdgeInsets.symmetric(horizontal:10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: CustomColors.dividerColor,
                  ),
                ),
                child: Column(
                  children: [
                    AccountWidget(
                      title: "Phone number",
                      subtitle: accountdata.phoneNumber,
                    ),
                    AccountWidget(
                      title: "Email",
                      subtitle: accountdata.email,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            RoundButton(
              press: () async {
                final AccountInfoModel? updatedAccountInfoList =
                    await Navigator.of(context).push<AccountInfoModel>(
                  MaterialPageRoute(
                    builder: (context) => EditAccountScreen(
                      initialData: accountdata,
                    ),
                  ),
                );

                if (updatedAccountInfoList != null) {
                  // Handle the updated data for all 6 instances
                  setState(() {
                    // Update your data list with the updated data
                    accountdata = updatedAccountInfoList;
                  });
                }
                return;
              },
              title: "Edit",
            )
          ],
        ),
      ),
    );
  }
}
