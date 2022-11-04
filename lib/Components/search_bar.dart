import 'package:flutter/material.dart';
import 'package:informatica/DataBase/home_data.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController scearch;
  final Function onSearchSubmit;
  const SearchBar(
      {super.key, required this.scearch, required this.onSearchSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
      child: TextField(
        onChanged: (value) => onSearchSubmit(),
        // onSubmitted: (value) => onSearchSubmit(),
        controller: scearch,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(3),
            hintText: HomePageData.homeData["NavbarSearch"],
            prefixIcon: Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
