import 'package:flutter/material.dart';
import 'package:informatica/DataBase/home_data.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // print(HomePageData.homeData);
    return data["AboutHeading"] == null
        ? Text("loding...")
        : Scaffold(
            appBar: AppBar(
              title: Text("Yojana Kendra"),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data["AboutHeading"],
                        style: TextStyle(fontSize: 30),
                      ),
                      Text(
                        " Yojana Kendra",
                        style: TextStyle(color: Colors.orange, fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["AboutSubHeading"],
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["AboutText"],
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            data["ExploreButton"],
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: Text(data["QueryButton"])),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 2000,
                    child: Text(data["RUheading"],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25)),
                  ),
                  for (int i = 0; i < data["RUList"].length; i++)
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                        child: Text("${i + 1}.  ${data["RUList"][i]}"))
                ],
              ),
            ),
          );
  }
}
