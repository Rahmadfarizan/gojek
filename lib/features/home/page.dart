import 'package:flutter/material.dart';
import 'package:gojek/features/home/part/home_page.dart';
import 'package:gojek/features/chat/presentation/page.dart';
import 'package:gojek/features/order/presentation/page.dart';
import 'package:gojek/features/promo/presentation/page.dart';

enum BottomMenu {
  beranda,
  promo,
  pesanan,
  chat,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late BottomMenu selectedMenu;
  @override
  void initState() {
    selectedMenu = BottomMenu.beranda;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        surfaceTintColor: const Color(0xFFFFFFFF),
      ),
      body: _getPageForMenu(selectedMenu),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget _getPageForMenu(BottomMenu menu) {
    final menuPages = {
      BottomMenu.beranda: const HomePage(),
      BottomMenu.promo: const PromoPage(),
      BottomMenu.pesanan: const OrderPage(),
      BottomMenu.chat: const ChatPage(),
    };

    return menuPages[menu] ?? const HomePage();
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
          buildItemMenu(
              "assets/icon/home_active.png", "Beranda", BottomMenu.beranda),
          buildItemMenu("assets/icon/promo.png", "Promo", BottomMenu.promo),
          buildItemMenu(
              "assets/icon/pesanan.png", "Pesanan", BottomMenu.pesanan),
          buildItemMenu("assets/icon/chat.png", "Chat", BottomMenu.chat),
        ],
      ),
    );
  }

  buildItemMenu(String icon, String label, BottomMenu bottomMenu) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMenu = bottomMenu;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        decoration: bottomMenu == selectedMenu
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
              color: bottomMenu == selectedMenu
                  ? const Color(0xFF00AA13)
                  : Colors.black.withOpacity(0.5),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style: TextStyle(
                  fontFamily: selectedMenu == bottomMenu
                      ? 'MaisonNeueBold'
                      : 'MaisonNeueBook',
                  fontSize: 13,
                  color: const Color(0xFF000000).withOpacity(0.8)),
            )
          ],
        ),
      ),
    );
  }
}
