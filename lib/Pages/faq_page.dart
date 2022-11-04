import 'package:flutter/material.dart';
import '../DataBase/home_data.dart';

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
    // TODO: implement initState
    if (!HomePageData.isDataLoaded) {
      lodehomeData();
    } else
      data = HomePageData.homeData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return data["AboutHeading"] == null
        ? Text("loding..")
        : Scaffold(
            appBar: AppBar(
              title: Text("Yojana Kendra"),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Text(
                  "FAQ",
                  style: TextStyle(fontSize: 30),
                ),
                Container(
                  height: 4,
                  color: Colors.orange,
                ),
                SizedBox(
                  height: 20,
                ),
                for (int i = 0; i < data["FAQQuestions"].length; i++)
                  Wrap(
                    children: [
                      Text(
                          style: TextStyle(),
                          softWrap: true,
                          "${i + 1}.  ${data["FAQQuestions"][i]}"),
                      Text("Ans  ${data["FAQAnswers"][i]}"),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
              ]),
            ),
          );
  }
}
