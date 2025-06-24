import 'package:flutter/material.dart';

class SaveButtonSignUp extends StatelessWidget {
  final bool isFormValid;
  final VoidCallback onPressed;

  const SaveButtonSignUp({
    super.key,
    required this.isFormValid,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isFormValid ? onPressed : null,
      child: Center(
        child: Container(
          width: 280,
          height: 60,
          decoration: BoxDecoration(
            color: isFormValid ? const Color(0xFFF4B300) : Colors.white, // برتقالي
            borderRadius: BorderRadius.circular(25),
            boxShadow: isFormValid
                ? []
                : [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              'إنشاء حساب',
              style: TextStyle(
                color: isFormValid ? Colors.white : Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: 'Alexandria',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
