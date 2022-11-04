import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:informatica/Pages/faq_page.dart';
import 'package:informatica/Pages/schemes_page.dart';
import 'Components/user_navigation_bar.dart';
import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  List? schemeTypeHeading = null;
  List<Widget> _pageToBeDisplay = [
    HomePage(),
    SchemesPage(),
    HomePage(),
    FAQPage(),
    HomePage()
  ];

  int pageIndex = 0;

  void changePageTo(int index) {
    pageIndex = index;
    setState(() {});
  }

  Future<void> readJason() async {
    final String response =
        await rootBundle.loadString("assets/Data/HomePageEnglish.json");
    final data = await json.decode(response)[0];
    // schemesName=
    // print(data["SchemeTypeHeading"][0]);

    setState(() {
      schemeTypeHeading = data["SchemeTypeHeading"];
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // HomePageData.putDataInHomeData();
  //   setState(() {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yojana kendra',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          body: _pageToBeDisplay[pageIndex],
          bottomNavigationBar: UserNavigationBar(changePage: changePageTo),
        ));
  }
}
