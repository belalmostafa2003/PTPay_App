import 'package:flutter/material.dart';

class DottedBorderText extends StatelessWidget {
  final String text;
  const DottedBorderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, height: .8),
      ),
    );
  }
}