import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/image/goride/header.png',
          fit: BoxFit.fitWidth,
        ),
        Container(
          margin: const EdgeInsets.only(top: 124),
          width: MediaQuery.of(context).size.width,
          height: 371,
          decoration: const BoxDecoration(
            color: Color(0xFF066A0B),
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(360, 28),
              bottom: Radius.elliptical(360, 28),
            ),
          ),
        ),
      ],
    );
  }
}
