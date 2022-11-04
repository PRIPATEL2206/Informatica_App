import 'dart:math';

import 'package:flutter/material.dart';
import 'package:informatica/Components/search_bar.dart';
import 'package:informatica/DataBase/scheme_data.dart';
import '../Components/all_schemes.dart';
import '../Components/individual_scheme.dart';

class SchemesPage extends StatefulWidget {
  SchemesPage({super.key});

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  List<dynamic> schemeTypes = [];
  List<dynamic> allSchemes = [];
  TextEditingController scearch = TextEditingController(text: "");

  Future<void> lodeSchemeData() async {
    await SchemeData.putDataInSchemeData();

    setState(() {
      schemeTypes = SchemeData.typeOfSchemes;
      allSchemes = SchemeData.schemeData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    if (!SchemeData.isDataLoaded) {
      lodeSchemeData();
    } else
      schemeTypes = SchemeData.typeOfSchemes;
    allSchemes = SchemeData.schemeData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // String t = "jdhdnfdfk";
    // print(scearch.value.text);
    allSchemes = SchemeData.schemeData
        .where((element) => element["Keywords"]
            .toLowerCase()
            .contains(scearch.text.toLowerCase()))
        .toList();
    return schemeTypes == []
        ? Text("loding..")
        : DefaultTabController(
            length: schemeTypes.length + 1,
            child: Scaffold(
              appBar: AppBar(
                actions: [Icon(Icons.settings)],
                title: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // Text("Schemes"),
                    SearchBar(
                        scearch: scearch,
                        onSearchSubmit: (() => setState(() {})))
                  ],
                ),
                bottom: TabBar(isScrollable: true, tabs: [
                  Tab(
                    child: Text("All Schemes"),
                  ),
                  for (int i = 0; i < schemeTypes.length; i++)
                    Tab(
                      child: Text(schemeTypes[i]),
                    ),
                ]),
              ),
              body: TabBarView(children: [
                AllSchemesTab(allSchemesData: allSchemes),
                for (int i = 0; i < schemeTypes.length; i++)
                  IndividiulSchemesTab(
                      indivisualSchemeData: allSchemes
                          .where((element) =>
                              element["Catagory"] == schemeTypes[i])
                          .toList())
              ]),
            ));
  }
}
