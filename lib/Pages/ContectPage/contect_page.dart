import 'package:flutter/material.dart';

class ContectPage extends StatelessWidget {
  const ContectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contect Page"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Name :"),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 300,
                  child: const TextField(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Email :"),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 300,
                  child: const TextField(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Phone :"),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 300,
                  child: const TextField(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      )),
    );
  }
}
