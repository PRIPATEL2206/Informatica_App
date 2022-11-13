import 'package:flutter/material.dart';
import 'package:informatica/Pages/SchemePage/scheme.dart';

class IndividiulSchemesTab extends StatelessWidget {
  ///Individul Schemes
  final List indivisualSchemeData;

  const IndividiulSchemesTab({super.key, required this.indivisualSchemeData});

  @override
  Widget build(BuildContext context) {
    // print(indivisualSchemeData[0]["Catagory"]);
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) => Scheme(
        schemeData: indivisualSchemeData[index],
      ),
      itemCount: indivisualSchemeData.length,
    );
  }
}
