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
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          onChanged: (value) => onSearchSubmit(),
          // onSubmitted: (value) => onSearchSubmit(),
          controller: scearch,
          decoration: InputDecoration(
            hintText: HomePageData.homeData["NavbarSearch"],
            prefixIcon: const Icon(Icons.search),
          ),
        ));
  }
}
