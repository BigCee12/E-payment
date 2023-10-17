import 'package:flutter/material.dart';

class CountryLanguages extends StatefulWidget {
  final String imagePath;
  final String countryName;

  const CountryLanguages(
      {super.key, required this.imagePath, required this.countryName});

  @override
  State<CountryLanguages> createState() => _CountryLanguagesState();
}

class _CountryLanguagesState extends State<CountryLanguages> {
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.imagePath,
          height: 40,
          width: 30,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          widget.countryName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
