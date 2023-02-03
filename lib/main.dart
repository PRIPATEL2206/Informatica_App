import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:informatica/Constans/ThemeData/change.dart';
import 'package:informatica/firebase_options.dart';
import 'Pages/user_navigation_bar.dart';
import 'Pages/HomePage/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Widget _curentPage = const HomePage();

  void changePageTo(Widget page) {
    _curentPage = page;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
