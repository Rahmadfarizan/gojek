import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  GlobalKey globalKey = GlobalKey();
  late TextEditingController searchController;
  late FocusNode focusNode;

  @override
  void initState() {
    searchController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 39,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: const Color(0xFFE8E8E8),
          border: Border.all(
            width: 1,
            color: const Color(0xFF000000).withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/icon/search.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(bottom: 4),
                child: TextFormField(
                  focusNode: focusNode,
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: "Cari layanan, makanan, & tujuan",
                      hintStyle: TextStyle(
                          fontFamily: "MaisonNeueBook",
                          fontSize: 14,
                          color: const Color(0xFF000000).withOpacity(0.5)),
                      border: InputBorder.none),
                  style: TextStyle(
                      fontFamily: "MaisonNeueBook",
                      fontSize: 14,
                      color: const Color(0xFF000000).withOpacity(0.5)),
                  cursorColor: Colors.grey,
                  onTapOutside: (_) {
                    focusNode.unfocus();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
