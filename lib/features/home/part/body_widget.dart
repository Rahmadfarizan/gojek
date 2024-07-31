import 'package:flutter/material.dart';
import 'package:gojek/features/home/part/discount_widget.dart';
import 'package:gojek/features/home/part/give_driver_rating_widget.dart';
import 'package:gojek/features/home/part/menu_widget.dart';
import 'package:gojek/features/home/part/payment_widget.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
