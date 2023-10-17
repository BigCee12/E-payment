import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/user_profile/languages/models/country_flags_model.dart';
import 'package:flutter/material.dart';
//import 'package:country_list_pick/country_list_pick.dart';
//import 'package:country_list_picker/country_list_picker.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  LanguageScreenState createState() => LanguageScreenState();
}

class LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = -1;
  List<CountryLanguages> items = [
    const CountryLanguages(
      imagePath: "assets/images/Flag-India.webp",
      countryName: "India",
    ),
    const CountryLanguages(
      imagePath: "assets/images/usa.png",
      countryName: "English(Us)",
    ),
    const CountryLanguages(
      imagePath: "assets/images/usa.png",
      countryName: "English(UK)",
    ),
    const CountryLanguages(
      imagePath: "assets/images/Indonesia.webp",
      countryName: "Indonesia",
    ),
    const CountryLanguages(
      imagePath: "assets/images/russia.png",
      countryName: "Russia",
    ),
    const CountryLanguages(
      imagePath: "assets/images/France.webp",
      countryName: "French",
    ),
    const CountryLanguages(
      imagePath: "assets/images/China.webp",
      countryName: "Chinese",
    ),
    const CountryLanguages(
      imagePath: "assets/images/usa.png",
      countryName: "Japanese",
    ),
    const CountryLanguages(
      imagePath: "assets/images/Germany.webp",
      countryName: "Germany",
    ),
    const CountryLanguages(
      imagePath: "assets/images/pakistan.webp",
      countryName: "Pakistan",
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Language",
          style: TextStyle(
            color: CustomColors.elevatedButtons,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    label: const Text(
                      'Search',
                      style: TextStyle(
                        color: CustomColors.elevatedButtons,
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
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
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: selectedIndex == index,
                    title: Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            items[index].imagePath,
                            width: 30,
                            height: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(items[index].countryName),
                        ],
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        onItemTapped(index);
                      });
                    },
                    checkboxShape: const CircleBorder(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
