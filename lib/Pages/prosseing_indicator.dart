import 'package:flutter/material.dart';

class DataProcessingIndicator extends StatelessWidget {
  final Function callback;

  const DataProcessingIndicator({super.key, required this.callback});

  void shiftTo() async {
    await callback();
  }

  @override
  Widget build(BuildContext context) {
    shiftTo();
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
