import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final bool isDataEntered;
  final VoidCallback onTap;

  const LoginButtonWidget({
    super.key,
    required this.isDataEntered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDataEntered ? onTap : null,
      child: Container(
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          color: isDataEntered ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (!isDataEntered)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: isDataEntered ? Colors.white : const Color(0xffACACAC),
              fontSize: 20,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w700,
              letterSpacing: 0.80,
            ),
          ),
        ),
      ),
    );
  }
}
