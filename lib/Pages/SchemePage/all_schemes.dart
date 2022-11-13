import 'package:flutter/material.dart';
import 'scheme.dart';
import 'package:informatica/DataBase/scheme_data.dart';

class AllSchemesTab extends StatelessWidget {
  final List<dynamic> allSchemesData;
  final List spradedAllSchemeData = [];

  AllSchemesTab({super.key, required this.allSchemesData});

  /// All Scheme

  void sparedData() {
    for (int i = 0; i < SchemeData.typeOfSchemes.length; i++) {
      spradedAllSchemeData.add(allSchemesData
          .where(
              (element) => element["Catagory"] == SchemeData.typeOfSchemes[i])
          .toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(allSchemesData.length);

    sparedData();

    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, schemeNameIndex) {
          return spradedAllSchemeData[schemeNameIndex].length == 0
              ? const SizedBox()
              : Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        SchemeData.typeOfSchemes[schemeNameIndex],
                        style: const TextStyle(fontSize: 24),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 220),

                        // height: 220,
                        // padding: const EdgeInsets.fromLTRB(1, 6, 1, 6),
                        // // color: Colors.orange,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Scheme(
                                schemeData:
                                    spradedAllSchemeData[schemeNameIndex]
                                        [index]);
                          },
                          itemCount:
                              spradedAllSchemeData[schemeNameIndex].length,
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    ],
                  ),
                );
        },
        separatorBuilder: ((context, index) => const SizedBox(
              height: 10,
            )),
        itemCount: SchemeData.typeOfSchemes.length);
  }
}
