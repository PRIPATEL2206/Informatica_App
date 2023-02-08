import 'package:flutter/material.dart';

class SchemeDetailPage extends StatelessWidget {
  final Map schemeData;
  const SchemeDetailPage({super.key, required this.schemeData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(schemeData["SchemeTitle"]),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Hero(
              tag: "schemePhoto${schemeData["ID"]}",
              child: SizedBox(
                child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/${schemeData["ImagePath"]}")),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Catagary      ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(": ${schemeData["Catagory"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "MaxAge       ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(": ${schemeData["MaxAge"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "MaxIncome ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(": ${schemeData["MaxIncome"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gender         ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(": ${schemeData["TextGender"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Caste           ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(": ${schemeData["Caste"]}"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Eligiblity      ",
                            textAlign: TextAlign.start,
                            softWrap: true,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            width: 300,
                            child: Text(": ${schemeData["EligiblityText"]}",
                                softWrap: true),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "About          ",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                              width: 300,
                              child: Text(": ${schemeData["SchemeInfo"]}")),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 23),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: const Text("Go To Scheme")),
                      )
                    ]),
              ),
            )
          ]),
        ));
  }
}
