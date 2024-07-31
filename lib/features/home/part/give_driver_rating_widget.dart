import 'package:flutter/material.dart';

class GiveDriverRatingWidget extends StatelessWidget {
  const GiveDriverRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Text(
            "Kasih rating dulu, yuk!",
            style: TextStyle(fontFamily: 'MaisonNeueBold', fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              width: 320,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
              margin: EdgeInsets.only(right: (index < 2) ? 16 : 0),
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 10,
                      color: const Color(0xFF000000).withOpacity(0.1),
                    ),
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/logo/gofood.png",
                        width: 70,
                        height: 17,
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/icon/cross.png",
                        height: 18,
                        width: 18,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/image/driver.png",
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Kasih rating ke driver ?",
                              style: TextStyle(
                                  fontFamily: 'MaisonNeueBold', fontSize: 16),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "Ayam Bakar Dan Soto Betawi Ibu Titin Jakarta Selatan",
                              style: TextStyle(
                                  fontFamily: 'MaisonNeueBook', fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "01 Jul 19:02",
                              style: TextStyle(
                                  fontFamily: 'MaisonNeueBook', fontSize: 12),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 30,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, i) => Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: Image.asset(
                                    "assets/icon/star.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
