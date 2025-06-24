import 'package:flutter/material.dart';

class SaveButtonSignUpDriver extends StatelessWidget {
  final bool isFormValid;
  final VoidCallback onPressed;

  const SaveButtonSignUpDriver({
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
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            gradient: isFormValid
                ? const LinearGradient(
              colors: [Color(0xFF090909), Color(0xFF293851)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
                : null,
            color: isFormValid ? null : Colors.white,
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
                fontSize: 16,
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