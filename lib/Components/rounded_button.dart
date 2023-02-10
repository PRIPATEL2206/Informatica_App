import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const RoundedButton(this.color, this.onPressed, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 42.0,
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
