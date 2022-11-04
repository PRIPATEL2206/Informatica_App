import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SchemeAppBar extends StatelessWidget {
  const SchemeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Yojana Kendra"),
    );
  }
}
