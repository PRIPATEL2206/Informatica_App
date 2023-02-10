import 'package:flutter/material.dart';
import '../../DataBase/home_data.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  Map data = {};
  Future<void> lodehomeData() async {
    await HomePageData.putDataInHomeData();

    setState(() {
      data = HomePageData.homeData;
    });
  }

  @override
  void initState() {
    if (!HomePageData.isDataLoaded) {
      lodehomeData();
    } else {
      data = HomePageData.homeData;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data["AboutHeading"] == null
        ? const Text("loding..")
        : Scaffold(
            appBar: AppBar(
              title: const Text("Yojana Kendra"),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                const Text(
                  "FAQ",
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  height: 4,
                  color: Colors.orange,
                ),
                const SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < data["FAQQuestions"].length; i++)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Wrap(
                        children: [
                          Text(
                            "${data["FAQQuestions"][i]}",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 50),
                          Text(
                            "Ans  ${data["FAQAnswers"][i]}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
              ]),
            ),
          );
  }
}
