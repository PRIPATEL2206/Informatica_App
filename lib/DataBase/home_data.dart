import 'package:firebase_database/firebase_database.dart';

class HomePageData {
  static bool isDataLoaded = false;
  static Map fullData = {};
  static String dataLangvage = "en";
  static Map homeData = {};

  static Future<void> putDataInHomeData() async {
    //  tack data from jason file
    // String response = "";
    // if (dataLangvage == "en") {
    //   response =
    //       await rootBundle.loadString("assets/Data/HomePageEnglish.json");
    // } else if (dataLangvage == "gu") {
    //   response =
    //       await rootBundle.loadString("assets/Data/HomePageGujarati.json");
    // }
    // homeData = await json.decode(response)[0];

    // take data from firebase realtime database database

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
