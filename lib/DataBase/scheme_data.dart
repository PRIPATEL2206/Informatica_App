import 'package:informatica/DataBase/home_data.dart';

class SchemeData {
  static Map<String, String> avalableLang = {
    "gu": "Gujarati",
    "en": "English",
  };

  static String dataLangvage = "en";

  static bool isDataLoaded = false;

  static List<dynamic> schemeData = [];

  static List<String> typeOfSchemes = [];

  static Future<void> putDataInSchemeData() async {
    //  tack data from jason file
    // String response = "";
    // if (dataLangvage == "en") {
    //   response = await rootBundle.loadString("assets/Data/SchemeEnglish.json");
    // } else if (dataLangvage == "gu") {
    //   response = await rootBundle.loadString("assets/Data/SchemeGujarati.json");
    // }
    // schemeData = await json.decode(response);
    // isDataLoaded = true;

    // typeOfSchemes = listOfTypeOfSchemes();

    // take data from home Page data that is alraady in
    if (!HomePageData.isDataLoaded ||
        HomePageData.dataLangvage != dataLangvage) {
      await HomePageData.putDataInHomeData();
    }
    schemeData = HomePageData.fullData["SchemePageData"];

    isDataLoaded = true;
    typeOfSchemes = listOfTypeOfSchemes();
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
