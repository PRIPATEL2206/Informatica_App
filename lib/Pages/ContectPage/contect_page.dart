import 'package:flutter/material.dart';
import 'package:informatica/Constants/constants.dart';
import '../../Components/rounded_button.dart';

class ContectPage extends StatelessWidget {
  const ContectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact us"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Name :",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 300,
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Name'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Email :",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 300,
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Email'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Phone :",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 300,
                  child: TextField(
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your Phone Number'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              child: RoundedButton(Colors.orange, () {
                const snckBar = SnackBar(
                    content: Text(
                        "Thank you for contect us wee will cattcch you soon"));
                ScaffoldMessenger.of(context).showSnackBar(snckBar);
              }, 'Submit'),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text("Submit"),
              // ),
            )
          ],
        ),
      )),
    );
  }
}
