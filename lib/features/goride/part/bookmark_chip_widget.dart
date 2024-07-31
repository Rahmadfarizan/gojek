import 'package:flutter/material.dart';

class BookmarkChipWidget extends StatelessWidget {
  const BookmarkChipWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 13, left: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: EdgeInsets.only(left: i == 0 ? 9 : 0),
              child: Container(
                margin: EdgeInsets.only(
                  right: i != 9 ? 6 : 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1,
                    color: const Color(0xFFDCDCDC),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.bookmark_rounded,
                        color: Color(0xFF949494),
                        size: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Kost Jaksel 39",
                        style: TextStyle(
                            fontFamily: "MaisonNeueBold",
                            fontSize: 14,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
