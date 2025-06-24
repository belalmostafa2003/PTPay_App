import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isVisible;
  final Function(String) onChanged;
  final VoidCallback toggleVisibility;

  const PasswordField({
    Key? key,
    required this.label,
    required this.controller,
    required this.isVisible,
    required this.onChanged,
    required this.toggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400,fontFamily: 'Alexandria')),
        const SizedBox(height: 9),
        TextField(
          controller: controller,
          obscureText: !isVisible,
          onChanged: onChanged,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: "*******",
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: 'Alexandria',
            color: Color(0xff979797),),
            prefixIcon: IconButton(
              icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: toggleVisibility,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
