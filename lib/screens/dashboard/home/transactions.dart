import 'package:epaymment/screens/dashboard/home/transactions_row_widget.dart';
import 'package:flutter/material.dart';

class TransactionsRow extends StatelessWidget {
  const TransactionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TransactionsRowWidget(
                  iconData: Icons.sports_football_rounded,
                  title: "Sports",
                  subtitle: "Payment",
                  amount: "-\$15.99"),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TransactionsRowWidget(
                  iconData: Icons.arrow_circle_down_sharp,
                  title: "Bank of America",
                  subtitle: "Deposit",
                  amount: "+\$2,045.00"),
            ),
            SizedBox(
            height: 20,
          ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TransactionsRowWidget(
                  iconData: Icons.sports_football_rounded,
                  title: "To Brody Armando",
                  subtitle: "Sent",
                  amount: "-\$986.00"),
            ),
          ],
        ),
      
    );
  }
}
