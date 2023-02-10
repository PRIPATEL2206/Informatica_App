import 'package:flutter/material.dart';
import 'package:informatica/Constans/ThemeData/change.dart';
import 'package:informatica/Pages/LodingScreen/loading_screen.dart';
import 'Pages/user_navigation_bar.dart';
import 'Pages/HomePage/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoadingScreen(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool pageChange = false;
  // This widget is the root of your application.

  void changePageTo(Widget page) {
    _curentPage = page;
    pageChange = true;
    setState(() {});
  }

  late Widget _curentPage;

  @override
  Widget build(BuildContext context) {
    if (!pageChange) {
      _curentPage = HomePage(
        changePage: changePageTo,
      );
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yojana kendra',
        theme: ThemeAdjustment.currentTheme,
        home: Scaffold(
          body: _curentPage,
          bottomNavigationBar: UserNavigationBar(changePage: changePageTo),
        ));
  }
}
