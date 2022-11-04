import 'dart:convert';

import 'package:flutter/services.dart';

class SchemeData {
  static String dataLangVage = "en";

  static bool isDataLoaded = false;

  static List<dynamic> schemeData = [];

  static List<String> typeOfSchemes = [];

  static Future<void> putDataInSchemeData() async {
    //  tack data from jason file
    String response = "";
    if (dataLangVage == "en") {
      response = await rootBundle.loadString("assets/Data/SchemeEnglish.json");
    } else if (dataLangVage == "gu") {
      response = await rootBundle.loadString("assets/Data/SchemeGujarati.json");
    }
    schemeData = await json.decode(response);
    isDataLoaded = true;

    typeOfSchemes = listOfTypeOfSchemes();
    // print(homeData["NavbarSearch"]);
    // render that data in
  }

  static List<String> listOfTypeOfSchemes() {
    List<String> typeOfSchemes = [];
    for (int i = 0; i < schemeData.length; i++) {
      if (!typeOfSchemes.contains(schemeData[i]["Catagory"])) {
        typeOfSchemes.add(schemeData[i]["Catagory"]);
      }
    }
    return typeOfSchemes;
  }
}
