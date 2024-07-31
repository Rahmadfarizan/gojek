import 'package:flutter/material.dart';

class PaymentMenuWidget extends StatelessWidget {
  const PaymentMenuWidget({
    super.key,
    required this.icon,
    required this.label,
  });
  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          Image.asset(
            icon,
            width: 24,
            height: 24,
          ),
          Text(
            label,
            style: const TextStyle(fontFamily: "MaisonNeueBook", fontSize: 12),
          ),
        ],
      ),
    );
  }
}
