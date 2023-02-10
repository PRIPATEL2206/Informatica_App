import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:informatica/DataBase/home_data.dart';
import 'package:informatica/main.dart';

import '../../firebase_options.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    lodeData() async => {
          await Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          await HomePageData.putDataInHomeData(),
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyApp(),
              ))
        };

    lodeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Stack(
            children: [
              Image.asset('assets/images/loading.png'),
              const Positioned(
                bottom: 105,
                left: 175,
                child: CircularProgressIndicator(
                  color: Colors.orange,
                  strokeWidth: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
