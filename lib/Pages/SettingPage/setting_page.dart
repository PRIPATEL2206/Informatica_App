import 'package:flutter/material.dart';
import 'package:informatica/DataBase/home_data.dart';
import 'package:informatica/DataBase/scheme_data.dart';

import '../../Constants/ThemeData/change.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final Map<String?, String?> langs = SchemeData.avalableLang;
  String? nowLang = HomePageData.dataLangvage;
  bool svalue = ThemeAdjustment.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeAdjustment.currentTheme,
      home: Scaffold(
          appBar: AppBar(title: const Text("Settings")),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Theme",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        const Icon(size: 18, Icons.sunny),
                        Switch(
                          activeColor: Colors.white,
                          inactiveTrackColor: Colors.black,
                          onChanged: (value) {
                            if (value) {
                              ThemeAdjustment.currentThemeIndex = 0;
                            } else {
                              ThemeAdjustment.currentThemeIndex = 1;
                            }
                            setState(() {
                              svalue = value;
                            });
                          },
                          value: svalue,
                        ),
                        const Icon(size: 18, Icons.mode_night),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Language",
                      style: TextStyle(fontSize: 20),
                    ),
                    DropdownButton<String>(
                      hint: const Text("Language"),
                      items: [
                        for (final lang in langs.keys)
                          DropdownMenuItem(
                            value: lang,
                            child: Text(langs[lang] ?? "not Found"),
                          )
                      ],
                      value: nowLang,
                      onChanged: (value) {
                        if (nowLang != value) {
                          nowLang = value;
                          setState(() {
                            HomePageData.isDataLoaded = false;
                            SchemeData.isDataLoaded = false;
                            HomePageData.dataLangvage =
                                value ?? HomePageData.dataLangvage;
                            SchemeData.dataLangvage =
                                value ?? SchemeData.dataLangvage;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ]),
            ),
          )),
    );
  }
}
