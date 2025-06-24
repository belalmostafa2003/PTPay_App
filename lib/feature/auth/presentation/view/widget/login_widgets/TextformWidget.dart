import 'package:flutter/material.dart';

class TextformWidget extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final void Function(String phone, String password) onDataEntered;

  const TextformWidget({
    super.key,
    required this.phoneController,
    required this.passwordController,
    required this.onDataEntered,
  });

  @override
  State<TextformWidget> createState() => _TextformWidgetState();
}

class _TextformWidgetState extends State<TextformWidget> {
  bool _isPasswordHidden = true;

  InputDecoration _decoration({
    required String hint,
    Widget? suffixIcon, Widget? prefixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: const TextStyle(
        fontSize: 14,
        fontFamily: 'Alexandria',
        fontWeight: FontWeight.w500,
        color: Color(0xff979797),
      ),
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xffE0E0E0), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xffE0E0E0), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xffBDBDBD), width: 1.5),
      ),
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
    );
  }

  @override
  void initState() {
    super.initState();
    widget.phoneController.addListener(_onTextChanged);
    widget.passwordController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    widget.onDataEntered(
      widget.phoneController.text,
      widget.passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // رقم الهاتف
        const Text(
          "رقم الهاتف",
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Alexandria',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.phoneController,
          keyboardType: TextInputType.phone,
          textAlign: TextAlign.right,
          decoration: _decoration(hint: 'رقم الهاتف'),
          onChanged: (_) => _onTextChanged(),
        ),
        const SizedBox(height: 16),

        // كلمة المرور
        const Text(
          "كلمة المرور",
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'Alexandria',
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.passwordController,
          obscureText: _isPasswordHidden,
          textAlign: TextAlign.right,
          decoration: _decoration(
            hint: 'كلمة المرور',
            suffixIcon: null,
            prefixIcon: IconButton(
              icon: Icon(
                _isPasswordHidden
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  _isPasswordHidden = !_isPasswordHidden;
                });
              },
            ),
          ),
          onChanged: (_) => _onTextChanged(),
        ),
      ],
    );
  }
}