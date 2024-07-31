import 'package:flutter/material.dart';
import 'package:gojek/features/goride/part/background_widget.dart';
import 'package:gojek/features/goride/part/content_widget.dart';

class GoRidePage extends StatefulWidget {
  const GoRidePage({super.key});

  @override
  State<GoRidePage> createState() => _GoRidePageState();
}

class _GoRidePageState extends State<GoRidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F3F4),
        body: Stack(
      children: [
        const BackgroundWidget(),
        buildButtonBackWidget(context),
        const ContentWidget(),
      ],
    ));
  }

  GestureDetector buildButtonBackWidget(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.all(16),
          child: Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(
              Icons.arrow_back,
              size: 16,
            ),
          ),
        ),
      );
  }
}
