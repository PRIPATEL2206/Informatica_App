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
                      const Text(
                        "Benifits :",
                        style: TextStyle(fontSize: 24),
                      ),
                      Container(
                        height: 4,
                        width: 80,
                        color: Colors.orange,
                      ),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            schemeData["SchemeInfo"],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Eligiblity :",
                        style: TextStyle(fontSize: 24),
                      ),
                      Container(
                        height: 4,
                        width: 80,
                        color: Colors.orange,
                      ),
                      Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            schemeData["EligiblityText"],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
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
