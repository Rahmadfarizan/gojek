import 'package:flutter/material.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xFF00AA13),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFFFFF),
            ),
            child: Image.asset("assets/logo/logo1.png"),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Diskon s.d 12rb/transaksi. Yuk, langganan",
            style: TextStyle(
                fontFamily: 'MaisonNeueBold',
                color: Color(0xFFFFFFFF),
                fontSize: 13),
          ),
          const Spacer(),
          Image.asset(
            "assets/icon/arrow_right_white.png",
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
