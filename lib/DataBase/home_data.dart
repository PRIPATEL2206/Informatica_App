import 'dart:async';
import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

class HomePageData {
  static bool isDataLoaded = false;
  static Map fullData = {};
  static String dataLangvage = "en";
  static Map homeData = {};

  static Future<void> putDataInHomeData() async {
    // take data from firebase realtime database database
    _putDataFromFirebase();

    await Future.delayed(const Duration(seconds: 7));

    if (!isDataLoaded) {
      //  tack data from jason file
      String response = "";
      response = await rootBundle.loadString("assets/Data/data.json");

      if (dataLangvage == "en") {
        fullData = await json.decode(response)[0];
      } else if (dataLangvage == "gu") {
        fullData = await json.decode(response)[1];
      }
      homeData = fullData["homePageData"];
      isDataLoaded = true;
    }
  }

  static Future<void> _putDataFromFirebase() async {
    String choosenLangvageForData = "en";
    if (dataLangvage == "en") {
      choosenLangvageForData = "EnglishData";
    } else if (dataLangvage == "gu") {
      choosenLangvageForData = "gujaratiData";
    }
    await FirebaseDatabase.instance
        .ref("/$choosenLangvageForData")
        .get()
        .then((value) => {
              if (value.value != null)
                {fullData = Map.from(value.value! as Map<Object?, Object?>)}
            });
    homeData = fullData["homePageData"];
    isDataLoaded = true;
  }
}
