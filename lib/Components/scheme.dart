import 'package:flutter/material.dart';

class Scheme extends StatelessWidget {
  final Map schemeData;

  const Scheme({super.key, required this.schemeData});

  @override
  Widget build(BuildContext context) {
    // print(schemeData["ImagePath"]);
    return Container(
        width: 200,
        height: 200,

        // color: Colors.orangeAccent,
        child: Column(
          children: [
            Container(
              width: 200,
              height: 150,
              child: Image(
                  fit: BoxFit.fitHeight,
                  image: AssetImage("assets/${schemeData["ImagePath"]}")),
            ),
            Text(
              schemeData["SchemeTitle"] ?? "Data Not Found",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ));
  }
}
