import 'package:flutter/material.dart';
import 'package:informatica/DataBase/home_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  Future<void> lodehomeData() async {
    if (!HomePageData.isDataLoaded) {
      await HomePageData.putDataInHomeData();
    }
    setState(() {
      data = HomePageData.homeData;
    });
  }

  @override
  void initState() {
    super.initState();
    lodehomeData();
  }

  @override
  Widget build(BuildContext context) {
    // print(HomePageData.homeData);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yojana Kendra"),
      ),
      body: HomePageData.isDataLoaded
          ? SingleChildScrollView(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data["AboutHeading"],
                        style: const TextStyle(fontSize: 30),
                      ),
                      const Text(
                        " Yojana Kendra",
                        style: TextStyle(color: Colors.orange, fontSize: 30),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["AboutSubHeading"],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data["AboutText"],
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
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
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: Text(data["QueryButton"])),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    color: Colors.orange,
                    width: 2000,
                    child: Text(data["RUheading"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 25)),
                  ),
                  for (int i = 0; i < data["RUList"].length; i++)
                    Card(
                        borderOnForeground: true,
                        elevation: 5,
                        surfaceTintColor: Colors.orange,
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${i + 1}.  ${data["RUList"][i]}"),
                          ),
                        ))
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
