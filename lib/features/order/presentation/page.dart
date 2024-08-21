import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Text("Aktivitas"),
    );
  }
    AppBar buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      toolbarHeight: 64,
      title: const Text(
        "Aktivitas",
        style: TextStyle(
          fontFamily: "MaisonNeueBold",
          fontSize: 24,
          color: Color(0xFF000000),
        ),
      ),
      shadowColor: Colors.grey.shade200,
      elevation: 1.2,
    );
  }
}
