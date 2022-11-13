import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:informatica/Pages/SchemePage/scheme_flter.dart';
import 'package:informatica/Pages/SchemePage/search_bar.dart';
import 'package:informatica/DataBase/scheme_data.dart';
import 'package:informatica/Pages/SchemePage/all_schemes.dart';
import 'individual_scheme.dart';

class SchemesPage extends StatefulWidget {
  const SchemesPage({super.key});

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  List<dynamic> schemeTypes = [];
  List<dynamic> allSchemes = [];
  TextEditingController scearch = TextEditingController(text: "");
  Map? filterData;

  Future<void> lodeSchemeData() async {
    if (!SchemeData.isDataLoaded) {
      await SchemeData.putDataInSchemeData();

      setState(() {
        schemeTypes = SchemeData.typeOfSchemes;
        allSchemes = SchemeData.schemeData;
      });
    }
    schemeTypes = SchemeData.typeOfSchemes;
    allSchemes = SchemeData.schemeData;
  }

  @override
  void initState() {
    super.initState();
    lodeSchemeData();
  }

  bool filterAcodingSelect(ele, Map? dataToChack) {
    if (dataToChack != null) {
      return (ele["Gender"].toLowerCase().contains(dataToChack["gender"]) &&
          ele["Caste"].toLowerCase().contains(dataToChack["cast"]) &&
          ele["MaxAge"] >= (dataToChack["age"]) &&
          ele["MaxIncome"] >= dataToChack["income"]);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    allSchemes = SchemeData.schemeData.where((element) {
      return element["Keywords"]
              .toLowerCase()
              .contains(scearch.text.toLowerCase()) &&
          filterAcodingSelect(element, filterData);
    }).toList();

    // print(filterData);

    return DefaultTabController(
        length: schemeTypes.length + 1,
        child: SchemeData.isDataLoaded
            ? Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () async {
                        filterData = await showSchemeFilter(context);
                        setState(() {});
                      },
                      icon: const Icon(Icons.manage_search),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
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
                    const Tab(
                      child: Text("All Schemes"),
                    ),
                    for (int i = 0; i < schemeTypes.length; i++)
                      Tab(
                        child: Text(schemeTypes[i]),
                      ),
                  ]),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TabBarView(children: [
                    AllSchemesTab(allSchemesData: allSchemes),
                    for (int i = 0; i < schemeTypes.length; i++)
                      IndividiulSchemesTab(
                          indivisualSchemeData: allSchemes
                              .where((element) =>
                                  element["Catagory"] == schemeTypes[i])
                              .toList())
                  ]),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  Future<Map?> showSchemeFilter(BuildContext context) async {
    Map? filterData;
    void changeData(String gender, String cast, int age, int income) {
      filterData = {
        "gender": gender,
        "cast": cast,
        "age": age,
        "income": income,
      };
    }

    await showCupertinoModalPopup<Map>(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          child: Scaffold(
            body: SchemeFilter(changeData: changeData),
          ),
        );
      },
    );
    return filterData ?? {};
  }
}
