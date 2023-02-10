import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                        elevation: 1,
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
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                schemeData["EligiblityText"],
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Maximum age : ${schemeData["MaxAge"].toString()}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Maximum Income : ${schemeData["MaxIncome"].toString()}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Caste : ${schemeData["Caste"].toString()}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Gender : ${schemeData["TextGender"].toString()}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
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
                            onPressed: () async {
                              Uri uri = Uri.parse(schemeData["SchemeLink"]);
                              _launchUrl(uri);
                            },
                            child: const Text("Go To Scheme")),
                      )
                    ]),
              ),
            )
          ]),
        ));
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
