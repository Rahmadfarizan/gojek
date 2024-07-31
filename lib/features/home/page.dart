import 'package:flutter/material.dart';
import 'package:gojek/features/home/part/body_widget.dart';
import 'package:gojek/features/home/part/notification_widget.dart';
import 'package:gojek/features/home/part/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
      ),
      body: Stack(
        children: [
          const SingleChildScrollView(child: BodyWidget()),
          buildAppBar(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      height: 64,
      padding: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(color: const Color(0xFFFFFFFF), boxShadow: [
        BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 10),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildItemMenu("assets/icon/home_active.png", "Beranda", true),
          buildItemMenu("assets/icon/promo.png", "Promo", false),
          buildItemMenu("assets/icon/pesanan.png", "Pesanan", false),
          buildItemMenu("assets/icon/chat.png", "Chat", false),
        ],
      ),
    );
  }

  buildItemMenu(String icon, String label, bool isActive) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      decoration: isActive
          ? BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                  const Color(0xFF52CE60).withOpacity(0.1),
                  const Color(0xFF52CE60).withOpacity(0.05),
                  const Color(0xFF52CE60).withOpacity(0.0),
                ]))
          : null,
      child: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Image.asset(
            icon,
            width: 24,
            height: 24,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: TextStyle(
                fontFamily: isActive ? 'MaisonNeueBold' : 'MaisonNeueBook',
                fontSize: 13,
                color: const Color(0xFF000000).withOpacity(0.8)),
          )
        ],
      ),
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
