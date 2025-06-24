import 'package:flutter/material.dart';
class Money extends StatelessWidget {
  const Money({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 90,
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xFF090909), Color(0xFF293851)],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'رصيد المحفظة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "88.5 جنيه",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Alexandria',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset('assets/icon/eye.png', height: 26, width: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
