import 'package:flutter/material.dart';
import 'package:gojek/features/home/part/payment_menu_widget.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      margin: const EdgeInsets.fromLTRB(16, 165, 16, 0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 1),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFFF7F7F7),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset("assets/icon/gopay.png"),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rp0",
                style: TextStyle(fontFamily: 'MaisonNeueBold', fontSize: 14),
              ),
              Text(
                "0 Coins",
                style: TextStyle(
                    fontFamily: 'MaisonNeueBook',
                    fontSize: 14,
                    color: const Color(0xFF000000).withOpacity(0.5)),
              )
            ],
          ),
          const Spacer(),
          const Row(
            children: [
              PaymentMenuWidget(
                icon: 'assets/icon/bayar.png',
                label: 'Bayar',
              ),
              PaymentMenuWidget(
                icon: 'assets/icon/top_up.png',
                label: 'Top Up',
              ),
              PaymentMenuWidget(
                icon: 'assets/icon/lainnya.png',
                label: 'Lainnya',
              ),
            ],
          )
        ],
      ),
    );
  }
}
