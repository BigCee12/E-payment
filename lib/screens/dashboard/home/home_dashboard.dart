import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/home/home_column_icons.dart';
import 'package:epaymment/screens/dashboard/home/transactions.dart';
import 'package:flutter/material.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({Key? key}) : super(key: key);
  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  
  
  String _getFormattedDate() {
    DateTime now = DateTime.now();
    String formattedDate =
        "${_getDayOfWeek(now.weekday)}, ${_getMonth(now.month)} ${now.day}";
    return formattedDate;
  }

  String _getDayOfWeek(int day) {
    List<String> daysOfWeek = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return daysOfWeek[day - 1];
  }

  String _getMonth(int month) {
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome back!",
              style: TextStyle(
                  color: Color.fromARGB(183, 100, 88, 88), fontSize: 20),
            ),
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Tommy Jason",
                    style: TextStyle(
                        color: CustomColors.elevatedButtons,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 55,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: CustomColors.textColor,
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        // Add your onPressed logic here
                      },
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 305,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 202, 200, 200),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 20,
                  child: Container(
                    width: 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: const Column(
                      children: [
                        IconTextWidget(
                            iconData: Icons.arrow_circle_down_rounded,
                            text: "Deposit"),
                        SizedBox(
                          height: 20,
                        ),
                        IconTextWidget(
                            iconData: Icons.cached_sharp, text: "Transfers"),
                        SizedBox(
                          height: 20,
                        ),
                        IconTextWidget(
                            iconData: Icons.arrow_circle_up_sharp,
                            text: "Withdraw"),
                        SizedBox(
                          height: 20,
                        ),
                        IconTextWidget(
                            iconData: Icons.read_more_outlined, text: "More"),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 100, // Adjust the left position as needed
                  top: 20, // Adjust the top position as needed
                  child: SizedBox(
                    height: 300, // Adjust the height as needed
                    width: 300, // Adjust the width as needed
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          2, // Adjust the number of cards/images as needed
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Define the routes you want to navigate to for each image.
                            if (index == 0) {
                              print("Hello there love");
                              // Replace with your route name
                            } else if (index == 1) {
                              print("Hello there");
                              //  pr / Replace with your route name
                            }
                          },
                          child: Card(
                            margin: const EdgeInsets.all(
                                10), // Add space between cards
                            child: Image.asset(
                              index == 0
                                  ? 'assets/images/1696242977196.jpg'
                                  : 'assets/images/1696244629298.jpg',
                              width: 200,
                              height: 200,
                            ), // Replace with your image paths
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  _getFormattedDate(),
                  style: const TextStyle(
                    color: CustomColors.elevatedButtons,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // Add your onPressed logic here
                  },
                  child: const Row(
                    children: [
                      Text(
                        "All transactions",
                        style: TextStyle(
                          color: CustomColors.elevatedButtons,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: CustomColors.elevatedButtons,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: TransactionsRow())
          ],
        ),
      ),
     
    );
  }
}
