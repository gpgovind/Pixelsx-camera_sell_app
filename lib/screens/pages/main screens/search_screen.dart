import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58.0, right: 10, left: 10),
      child: AnimSearchBar(
        color: const Color.fromRGBO(54, 57, 65, 1),
        searchIconColor: Colors.white,
        textFieldColor: const Color.fromARGB(255, 222, 218, 218),
        rtl: true,
        width: 400,
        textController: textController,
        autoFocus: true,
        onSubmitted: (p0) {},
        onSuffixTap: () {
          setState(() {
            textController.clear();
          });
        },
      ),
    );
  }
}
