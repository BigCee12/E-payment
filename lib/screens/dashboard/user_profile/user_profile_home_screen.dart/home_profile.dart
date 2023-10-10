import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/referral_code/referral_code.dart';
import 'package:epaymment/screens/dashboard/user_profile/user_profile_home_screen.dart/user_profile_model/user_profile_model.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false, // Hide the back button
            centerTitle: true,
            title: const Text(
              "Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
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
                      child: const Center(
                        child: Icon(
                          size: 20,
                          Icons.edit,
                          color: Color.fromARGB(255, 62, 52, 52),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "John Doe",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const Text(
            "johndoe@example.com",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 40),
          ProfileRow(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ReferralCodeWidget()));
            },
            iconColor: Colors.deepOrange,
            iconSize: 34,
            icon: Icons.clear_all_rounded,
            text: "Referral Code",
          ),
          const ProfileRow(
            iconColor: CustomColors.elevatedButtons,
            iconSize: 34,
            icon: Icons.account_circle_sharp,
            text: "Account Info",
          ),
          // Add more profile rows as needed
          const ProfileRow(
            iconColor: Colors.lightGreen,
            iconSize: 34,
            icon: Icons.people_alt_sharp,
            text: "Contact List",
          ),
          const ProfileRow(
            iconColor: Colors.deepPurple,
            iconSize: 34,
            icon: Icons.language,
            text: "Language",
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(thickness: 1),
          const SizedBox(
            height: 8,
          ),
          const ProfileRow(
            iconColor: Color.fromARGB(255, 26, 25, 25),
            iconSize: 34,
            icon: Icons.my_location_outlined,
            text: "Nearby List",
          ),
          const ProfileRow(
            iconColor: Color.fromARGB(255, 22, 182, 203),
            iconSize: 34,
            icon: Icons.settings,
            text: "General Settings",
          ),
          const ProfileRow(
            iconColor: Color.fromARGB(255, 213, 137, 24),
            iconSize: 34,
            icon: Icons.lock_outlined,
            text: "Change Password",
          ),
          const ProfileRow(
            iconColor: CustomColors.elevatedButtons,
            iconSize: 34,
            icon: Icons.help_outline,
            text: "FAQ's",
          ),
          const ProfileRow(
            iconColor: CustomColors.elevatedButtons,
            iconSize: 34,
            icon: Icons.question_answer,
            text: "Help",
          ),
        ],
      ),
    );
  }
}
