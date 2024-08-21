import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

enum Promo { all, gocar, gofood, goride, gopay, promo }

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  late Promo selectedPromo;
  final List<String> imgList = [
    "assets/image/promo/promo1.png",
    "assets/image/promo/promo2.png",
    "assets/image/promo/promo3.png",
    "assets/image/promo/promo4.png",
  ];
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  void initState() {
    selectedPromo = Promo.all;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              buildVoucher(context),
              const SizedBox(
                height: 16,
              ),
              buildPromoInputCode(context),
              const SizedBox(
                height: 8,
              ),
              buildPromoInviteFriend(context),
              const SizedBox(
                height: 18,
              ),
              buildPromoTitle('Promo menarik buat kamu'),
              const SizedBox(
                height: 16,
              ),
              buildChips(),
              const SizedBox(
                height: 32,
              ),
              buildPromoTitle('Biar makin hemat'),
              const SizedBox(
                height: 12,
              ),
              buildPromoBanner(context),
              buildPromoIndicator(),
              buildPromoTitle('Resto dengan rating jempolan'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Ad',
                  style: TextStyle(
                    fontFamily: "MaisonNeueBook",
                    fontSize: 14,
                    color: const Color(0xFF000000).withOpacity(0.8),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                  padding:
                  const EdgeInsets.only(left: 20, top: 24, bottom: 24),
                child: Row(
                  children: [
                    for (int i = 1; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 0.1,
                                color:
                                    const Color(0xFF000000).withOpacity(0.1),
                              ),
                              BoxShadow(
                                offset: const Offset(1, 0),
                                blurRadius: 0.1,
                                color:
                                    const Color(0xFF000000).withOpacity(0.05),
                              ),
                              BoxShadow(
                                offset: const Offset(-1, 0),
                                blurRadius: 0.1,
                                color:
                                    const Color(0xFF000000).withOpacity(0.1),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.width / 2.5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      "assets/image/promo/food$i.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Text(
                                  "4.89 km",
                                  style: TextStyle(
                                    fontFamily: "MaisonNeueBook",
                                    fontSize: 12,
                                    color: const Color(0xFF000000)
                                        .withOpacity(0.5),
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                ),
                                child: Text(
                                  "Mie Goreng Mas Rahmad Cilandak",
                                  style: TextStyle(
                                    fontFamily: "MaisonNeueBold",
                                    fontSize: 16,
                                    color: Color(0xFF000000),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                ),
                              ),
                               Padding(
                                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      color: Colors.orange,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        fontFamily: "MaisonNeueBook",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF000000).withOpacity(0.8),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPromoInviteFriend(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                "assets/icon/people.png",
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: Text(
                  "Ajak teman, dapat voucher",
                  style: TextStyle(
                      fontFamily: "MaisonNeueBook",
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF000000)),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 28,
                color: Colors.black.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPromoInputCode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                "assets/icon/promo.png",
                height: 24,
                width: 24,
                color: Colors.orange,
              ),
              const SizedBox(
                width: 8,
              ),
              const Expanded(
                child: Text(
                  "Masukkan kode promo",
                  style: TextStyle(
                      fontFamily: "MaisonNeueBook",
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF000000)),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 28,
                color: Colors.black.withOpacity(0.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Padding buildPromoTitle() {
  //   return const Padding(
  //     padding: EdgeInsets.symmetric(horizontal: 20),
  //     child: Text(
  //       "Promo menarik buat kamu",
  //       style: TextStyle(
  //         fontFamily: "MaisonNeueBold",
  //         fontSize: 18,
  //         color: Color(0xFF000000),
  //       ),
  //       textAlign: TextAlign.left,
  //     ),
  //   );
  // }

  Padding buildPromoTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: "MaisonNeueBold",
          fontSize: 18,
          color: Color(0xFF000000),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Padding buildPromoIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == entry.key
                      ? const Color(0xFF00AA13)
                      : Colors.black.withOpacity(0.5)),
            ),
          );
        }).toList(),
      ),
    );
  }

  SizedBox buildPromoBanner(BuildContext context) {
    return SizedBox(
      height: 164,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
            viewportFraction: 0.9,
            enlargeCenterPage: false,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
        items: imgList
            .map((item) => Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage(item),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  SingleChildScrollView buildChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPromo = Promo.all;
              });
            },
            child: ItemChipWidget(
              title: 'Apa aja',
              isActive: selectedPromo == Promo.all,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPromo = Promo.gocar;
              });
            },
            child: ItemChipWidget(
              title: 'GoCar',
              isActive: selectedPromo == Promo.gocar,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPromo = Promo.gofood;
              });
            },
            child: ItemChipWidget(
              title: 'GoFood',
              isActive: selectedPromo == Promo.gofood,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPromo = Promo.gopay;
              });
            },
            child: ItemChipWidget(
              title: 'GoPay',
              isActive: selectedPromo == Promo.gopay,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPromo = Promo.goride;
              });
            },
            child: ItemChipWidget(
              title: 'GoRide',
              isActive: selectedPromo == Promo.goride,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedPromo = Promo.promo;
              });
            },
            child: ItemChipWidget(
              title: 'Promo',
              isActive: selectedPromo == Promo.promo,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildVoucher(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    width: 0.5, color: Colors.black.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 0.1,
                    color: const Color(0xFF000000).withOpacity(0.1),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 88) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "249",
                          style: TextStyle(
                            fontFamily: "MaisonNeueBold",
                            fontSize: 18,
                            height: 0,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                        )
                      ],
                    ),
                    Text(
                      "Voucher & paket",
                      style: TextStyle(
                        fontFamily: "MaisonNeueBold",
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: const Color(0xFF000000).withOpacity(0.8),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 4,
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(16)),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    width: 0.5, color: Colors.black.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 0.1,
                    color: const Color(0xFF000000).withOpacity(0.1),
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
              child: SizedBox(
                width: (MediaQuery.of(context).size.width - 88) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            fontFamily: "MaisonNeueBold",
                            fontSize: 18,
                            height: 0,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                        )
                      ],
                    ),
                    Text(
                      "Langganan",
                      style: TextStyle(
                        fontFamily: "MaisonNeueBold",
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: const Color(0xFF000000).withOpacity(0.8),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 4,
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(16)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      toolbarHeight: 64,
      title: const Text(
        "Promo",
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

class ItemChipWidget extends StatelessWidget {
  const ItemChipWidget({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
            color: isActive ? const Color(0xFF00AA13) : Colors.white,
            border: isActive
                ? null
                : Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
            borderRadius: BorderRadius.circular(24)),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "MaisonNeueBook",
            fontWeight: isActive ? FontWeight.w700 : null,
            fontSize: 12,
            color: isActive ? Colors.white : Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
