import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/registration/cards/new_card/icon_buttons.dart';
import 'package:flutter/material.dart';

class FullScreenImageWidget extends StatelessWidget {
  const FullScreenImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:[
          const  Center(
              child:  Text(
              "Choose your style",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: CustomColors.elevatedButtons)),
            ),
            GestureDetector(
            onTap: () {
              //Navigate to another screen when tapped
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const ThreeIconButtonsWidget()),
              );
            },
            child: Center(
              child: Image.asset(
                "assets/images/choose_card.jpg",
                fit: BoxFit.cover, // Cover the whole screen
              ),
            ),
          ),
        ]),
      ),
    );
  }
}




