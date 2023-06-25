import 'package:flutter/material.dart';
class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(21),
      child: TextFormField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: BorderSide.none),
            fillColor: const Color(0xffF2F2F2),
            filled: true,
            hintText: "Search Books, Authors ",
            prefixIcon: const Padding(
              padding: EdgeInsetsDirectional.only(start:12),
              child: Icon(
                Icons.search_rounded,
                color:Color(0xff212121),
              ),
            ),suffixIcon: const Icon(Icons.add_road_outlined),
            contentPadding: const EdgeInsetsDirectional.only(start: 6),
            helperStyle: const TextStyle(fontSize: 14, color: Color(0xff212121))),

      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(88);
}
