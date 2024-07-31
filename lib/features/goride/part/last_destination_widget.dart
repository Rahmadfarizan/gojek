
import 'package:flutter/material.dart';

class LastDestinationWidget extends StatelessWidget {
  const LastDestinationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        const Divider(
          height: 1,
          color: Color(0xFFD0D0D0),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFFE8E8E8),
          height: 11,
        ),
        for (int i = 0; i < 10; i++)
          Column(
            children: [
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 13,vertical: 4),
                titleAlignment: ListTileTitleAlignment.top,
                leading: Column(
                  children: [
                    Icon(
                      Icons.access_time_filled_rounded,
                      size: 24,
                      color: Color(0xFF949494),
                    ),
                  ],
                ),
                title: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jl. Sudirman no.50a",
                            style: TextStyle(
                                fontFamily: "MaisonNeueBold",
                                fontSize: 14,
                                color: Color(0xFF000000)),
                          ),
                          Text(
                            "QPVM+F57 Jl. Sudirman no.50a R.T.3/R.W.4 Kecamatan Cilandak",
                            style: TextStyle(
                                fontFamily: "MaisonNeueLight",
                                fontSize: 12,
                                color: Color(0xFF000000)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.bookmark_rounded,
                      size: 16,
                      color: Color(0xFF949494),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              if (i != 9)
                const Divider(
                  height: 1,
                  color: Color(0xFFD0D0D0),
                ),
            ],
          )
      ],
    );
  }
}
