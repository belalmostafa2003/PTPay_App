import 'package:flutter/material.dart';

Widget buildTextField({
  required String label,
  required String hint,
  TextInputType keyboardType = TextInputType.text,
  TextEditingController? controller, required void Function(dynamic _) onChanged,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16,fontFamily: 'Alexandria',fontWeight: FontWeight.w400),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontFamily: 'Alexandria',
              color: Color(0xff979797),
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "هذا الحقل مطلوب";
            }
            return null;
          },
        ),
      ],
    ),
  );
}
