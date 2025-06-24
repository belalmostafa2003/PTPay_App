import 'package:flutter/material.dart';

class LoginButtonMoney extends StatefulWidget {
  final bool isDataEntered;
  final VoidCallback onTap;

  const LoginButtonMoney({
    super.key,
    required this.isDataEntered,
    required this.onTap,
  });

  @override
  State<LoginButtonMoney> createState() => _LoginButtonMoneyState();
}

class _LoginButtonMoneyState extends State<LoginButtonMoney> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          gradient: widget.isDataEntered
              ? const LinearGradient(
            colors: [
              Color(0xFF090909),
              Color(0xFF293851),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
              : const LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            if (!widget.isDataEntered)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
          ],
        ),
        child: Center(
          child: Text(
            'إرسال',
            style: TextStyle(
              color: widget.isDataEntered ? Colors.white :const Color(0xffACACAC),
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
