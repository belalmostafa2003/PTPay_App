import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String text;

  LanguageButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          print("تم تغيير اللغة إلى: $text");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 21,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}