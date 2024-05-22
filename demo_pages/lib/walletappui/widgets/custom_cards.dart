import 'package:demo_pages/walletappui/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget with ThemeColors{

  CustomCards({
    super.key,
    required this.balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.color,
  });
  final double balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;

//17.20
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      padding: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
      width: 270,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Balance",
            style: TextStyle(color: cardTextColor),
          ),
          Text(
            '\$$balance.00',
            style: TextStyle(color: cardTextColor, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //card number
                Text("**** $cardNumber", style: TextStyle(color: cardTextColor)),

                //card expiry date
                Text(
                  "$expiryMonth/$expiryYear",
                  style: TextStyle(color: cardTextColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
