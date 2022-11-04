import 'package:flutter/material.dart';
import 'package:informatica/Components/scheme.dart';

class IndividiulSchemesTab extends StatelessWidget {
  ///Individul Schemes
  final List indivisualSchemeData;

  const IndividiulSchemesTab({super.key, required this.indivisualSchemeData});

  @override
  Widget build(BuildContext context) {
    // print(indivisualSchemeData[0]["Catagory"]);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: [
            for (int i = 0; i < indivisualSchemeData.length; i++)
              Scheme(
                schemeData: indivisualSchemeData[i],
              )
          ],
        ),
      ),
    );
  }
}
