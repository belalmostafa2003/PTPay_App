import 'package:flutter/material.dart';

Widget notificationBox(List<String> texts, {bool isRead = false}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: isRead ? const Color(0xFFFFFFFF) : const Color(0xFFE0E0E0),
      border: Border.all(color: Color(0xFFF5A800)),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.rtl,
      children: texts.map((text) {
        // نفصل الإيموجي إذا موجود
        String emoji = '';
        String content = text;

        if (text.isNotEmpty && text.codeUnitAt(0) > 0x1F000) {
          emoji = text.substring(
              0, 2); // ناخد أول رمزين (عشان بعض الإيموجيات رمزين)
          content = text.substring(2).trim();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (emoji.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2),
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              Expanded(
                child: Text(
                  content,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
