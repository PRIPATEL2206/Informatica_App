import 'dart:math';

import 'package:flutter/material.dart';

class Scheme extends StatelessWidget {
  final Map schemeData;

  const Scheme({super.key, required this.schemeData});

  @override
  Widget build(BuildContext context) {
    // print(schemeData["ImagePath"]);
    return Card(
      child: SizedBox(
          width: 200,
          height: 220,

          // color: Colors.orangeAccent,
          child: Column(
            children: [
              SizedBox(
                width: 200,
                height: 150,
                child: Image(
                    fit: BoxFit.fitHeight,
                    image: AssetImage("assets/${schemeData["ImagePath"]}")),
              ),
              Center(
                child: Text(
                  "${schemeData["SchemeTitle"].toString().substring(0, min(schemeData["SchemeTitle"].toString().length, 40))}...",
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
