import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/my_cards/cards_model/card_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardDetailScreen extends StatelessWidget {
  final RowItem rowItem;

  const CardDetailScreen({Key? key, required this.rowItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Card Details',
            style: TextStyle(
              color: CustomColors.elevatedButtons,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            CreditCardWidget(
              // isSwipeGestureEnabled: true,
              cardType: CardType.mastercard,
              obscureCardNumber: false,
              isHolderNameVisible: true,
              bankName: "Central Bank Of Nigeria",
              cardNumber: rowItem.accountNumber,
              expiryDate: rowItem.expiryDate,
              cardHolderName: rowItem.name,
              cvvCode: rowItem.cvvNumber,
              showBackView: false,
              onCreditCardWidgetChange:
                  (creditCardBrand) {}, //true when you want to show cvv(back) view
            ),
          ],
        ),
      ),
    );
  }
}
