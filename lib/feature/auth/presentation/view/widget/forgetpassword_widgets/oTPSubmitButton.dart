import 'package:flutter/material.dart';

class OTPSubmitButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onSubmit;

  const OTPSubmitButton({
    Key? key,
    required this.isEnabled,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isEnabled ? onSubmit : null,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black, // ثابت دايمًا أسود
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            'تم',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.80,
            ),
          ),
        ),
      ),
    );
  }
}
