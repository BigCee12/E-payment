import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/general_settings/general_settings_model.dart';
import 'package:flutter/material.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Setting",
            style: TextStyle(
                color: CustomColors.elevatedButtons,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 231, 231),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        color: CustomColors.elevatedButtons,
                        Icons.notifications_outlined,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Add new bank",
                      style: TextStyle(
                        color: CustomColors.elevatedButtons,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_right_outlined,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 235, 231, 231),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        color: Colors.cyan,
                        Icons.settings,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Add new bank",
                      style: TextStyle(
                        color: CustomColors.elevatedButtons,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_right_outlined,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: GeneralSettingsModel(
                title: "Default Notification Actions",
                subtext: "You want to receive bill",
                subtitle: "reminders before a bill is due",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: GeneralSettingsModel(
                title: "Bills Calender",
                subtext: "You want to receive bill",
                subtitle: "reminder emails before a bill is due",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: GeneralSettingsModel(
                title: "Credit Score Calender",
                subtext: "You want to sync credit score",
                subtitle: "reminders to your device calendar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
