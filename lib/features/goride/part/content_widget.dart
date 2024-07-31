import 'package:flutter/material.dart';
import 'package:gojek/features/goride/part/bookmark_chip_widget.dart';
import 'package:gojek/features/goride/part/last_destination_widget.dart';
import 'package:gojek/features/goride/part/map_widget.dart';
import 'package:gojek/features/goride/part/search_widget.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({
    super.key,
  });

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 124),
      alignment: Alignment.topCenter,
      child: ClipRRect(
        borderRadius:
            const BorderRadius.vertical(top: Radius.elliptical(360, 28)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildTitleWidget(),
              Stack(
                children: [
                  buildCardHeader(context),
                  buildContent(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              MapWidget(),
              SearchWidget(),
              BookmarkChipWidget(),
              LastDestinationWidget()
            ],
          ),
        ),
      ),
    );
  }

  Container buildCardHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color(0xFF0CAD17),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      height: 116,
      child: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 24),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Coba fitur Edit Stasiun di GoTransit!",
                    style: TextStyle(
                      fontFamily: 'MaisonNeueBold',
                      color: Colors.white,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Bisa pilih rute dan stasiun sesuka kamu, ada diskon90%.Klik",
                    style: TextStyle(
                      fontFamily: 'MaisonNeueBook',
                      color: Colors.white,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 11,
            )
          ],
        ),
      ),
    );
  }

  buildTitleWidget() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            "Mau ke mana, Rahmad?",
            style: TextStyle(
                fontFamily: 'MaisonNeueBold',
                color: Colors.white,
                fontSize: 24),
          ),
          Text(
            "Gojek bisa anter kamu ke mana aja.",
            style: TextStyle(
                fontFamily: 'MaisonNeueBold',
                color: Color(0xFFF7F7F7),
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
