import 'package:flutter/material.dart';
import 'package:gojek/features/home/part/discount_widget.dart';
import 'package:gojek/features/home/part/give_driver_rating_widget.dart';
import 'package:gojek/features/home/part/menu_widget.dart';
import 'package:gojek/features/home/part/notification_widget.dart';
import 'package:gojek/features/home/part/payment_widget.dart';
import 'package:gojek/features/home/part/search_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 62),
            child: Stack(
              children: [
                Image.asset("assets/image/banner.png",
                    fit: BoxFit.fitWidth,
                    height: 196,
                    width: MediaQuery.of(context).size.width),
                const Column(
                  children: [
                    PaymentWidget(),
                    MenuWidget(),
                    DiscountWidget(),
                    GiveDriverRatingWidget(),
                    SizedBox(
                      height: 64,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        buildAppBar(),
      ],
    );
  }

  Container buildAppBar() {
    return Container(
      height: 72,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        boxShadow: [
          BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.1),
              offset: const Offset(0, 1),
              blurRadius: 10),
        ],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: const Row(
        children: [
          SearchWidget(),
          SizedBox(
            width: 13,
          ),
          NotificationWidget()
        ],
      ),
    );
  }
}
