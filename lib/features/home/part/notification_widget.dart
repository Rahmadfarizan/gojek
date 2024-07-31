import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: const Color(0xFFDCDCDC),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        "assets/icon/person.png",
      ),
    );
  }
}
