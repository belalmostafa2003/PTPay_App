import 'package:flutter/material.dart';

Widget buildSmallInfoTile(String label, String value) {
  final controller = TextEditingController(text: value);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 4),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'Alexandria',
          ),
        ),
      ),
      TextField(
        controller: controller,
        readOnly: true,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
          fontSize: 14,
          fontFamily: 'Alexandria',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ],
  );
}
