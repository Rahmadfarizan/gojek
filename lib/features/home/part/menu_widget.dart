import 'package:flutter/material.dart';
import 'package:gojek/features/goride/page/page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var menu = [
      [
        "assets/menu/goride.png",
        'GoRide',
        const GoRidePage(),
      ],
      [
        "assets/menu/gocar.png",
        'GoCar',
        const GoRidePage(),
      ],
      [
        "assets/menu/gofood.png",
        'GoFood',
        const GoRidePage(),
      ],
      [
        "assets/menu/gosend.png",
        'GoSend',
        const GoRidePage(),
      ],
      [
        "assets/menu/gomart.png",
        'GoMart',
        const GoRidePage(),
      ],
      [
        "assets/menu/gopulsa.png",
        'GoPulsa',
        const GoRidePage(),
      ],
      [
        "assets/menu/gotagihan.png",
        'GoTagihan',
        const GoRidePage(),
      ],
      [
        "assets/menu/lainnya.png",
        'lainnya',
        const GoRidePage(),
      ],
    ];
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: menu.length,
        itemBuilder: (context, i) => buildItemMenu(
            context, menu[i][0].toString(), menu[i][1].toString(), menu[i][2]),
      ),
    );
  }

  GestureDetector buildItemMenu(
    BuildContext context,
    String icon,
    String label,
    dynamic page,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      ),
      child: Column(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  icon,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            label,
            style: TextStyle(
                fontFamily: 'MaisonNeueBold',
                color: const Color(0xFF000000).withOpacity(0.7),
                fontSize: 12),
          )
        ],
      ),
    );
  }
}
