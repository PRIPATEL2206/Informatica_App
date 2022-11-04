import 'dart:convert';

import 'package:flutter/services.dart';

class HomePageData {
  static bool isDataLoaded = false;
  static String dataLangvage = "en";
  static Map homeData = {};

  static Future<void> putDataInHomeData() async {
    //  tack data from jason file
    String response = "";
    if (dataLangvage == "en") {
      response =
          await rootBundle.loadString("assets/Data/HomePageEnglish.json");
    } else if (dataLangvage == "gu") {
      response =
          await rootBundle.loadString("assets/Data/HomePageGujarati.json");
    }
    homeData = await json.decode(response)[0];
    isDataLoaded = true;
    // print(homeData["NavbarSearch"]);
    // render that data in
  }
}
