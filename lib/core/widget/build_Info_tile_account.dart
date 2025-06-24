import 'package:flutter/material.dart';

/// Builds a section title with the given [title].
Widget buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          color: Color(0xffF4B300),
          fontFamily: 'Alexandria',
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

/// Builds an info tile displaying [label] and [value], optionally
/// showing a button with [buttonText] that calls [onButtonTap].
Widget buildInfoTile(
    String label,
    String value, {
      bool isBold = false,
      String? buttonText,
      VoidCallback? onButtonTap,
    }) {
  final controller = TextEditingController(text: value);

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Column(
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
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Alexandria',
            fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // If both buttonText and onButtonTap are provided, show the button:
            suffixIcon: (buttonText != null && onButtonTap != null)
                ? TextButton(
              onPressed: onButtonTap,
              child: Text(
                buttonText,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Alexandria',
                ),
              ),
            )
                : null,
          ),
        ),
      ],
    ),
  );
}