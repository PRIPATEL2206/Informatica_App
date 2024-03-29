import 'package:flutter/material.dart';
import 'package:informatica/Constants/route_data.dart';
import 'package:informatica/DataBase/home_data.dart';
import 'package:informatica/Pages/ContectPage/contect_page.dart';
import 'package:informatica/Pages/SchemePage/schemes_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../Components/rounded_button.dart';

class HomePage extends StatefulWidget {
  final Function changePage;
  const HomePage({
    super.key,
    required this.changePage,
    // required this.changePage,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
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
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          data["AboutHeading"],
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.orange,
                            fontSize: 60.0,
                            fontWeight: FontWeight.w700,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText('Yojna Kendra'),
                              TyperAnimatedText('Yojna Portal'),
                              TyperAnimatedText('All in one yojna'),
                            ],
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      data["AboutSubHeading"],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: Text(
                        data["AboutText"],
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RoundedButton(
                      Colors.orange,
                      () {
                        widget.changePage(const SchemesPage());
                        UserNavigation.index = 1;
                      },
                      data["ExploreButton"],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    RoundedButton(Colors.orange, () {
                      widget.changePage(const ContectPage());
                      UserNavigation.index = 2;
                    }, data["QueryButton"]),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       widget.changePage(const ContectPage());
                    //       UserNavigation.index = 2;
                    //     },
                    //     child: Text(data["QueryButton"])),
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
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
