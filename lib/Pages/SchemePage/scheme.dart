import 'package:flutter/material.dart';
import 'package:informatica/Pages/SchemePage/scheme_detail.dart';

class Scheme extends StatelessWidget {
  final Map schemeData;

  const Scheme({super.key, required this.schemeData});

  @override
  Widget build(BuildContext context) {
    // print(schemeData["ImagePath"]);
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SchemeDetailPage(
                      schemeData: schemeData,
                    )));
      },
      child: Card(
        child: SizedBox(
            width: 200,
            height: 220,
            // color: Colors.orangeAccent,
            child: Column(
              children: [
                Hero(
                  tag: "schemePhoto${schemeData["ID"]}",
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image(
                        fit: BoxFit.fitHeight,
                        image: AssetImage("assets/${schemeData["ImagePath"]}")),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
                  child: Text(
                    // .substring(0, min(schemeData["SchemeTitle"].toString().length, 40))}...
                    schemeData["SchemeTitle"].toString(),
                    style: const TextStyle(fontSize: 15),
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
