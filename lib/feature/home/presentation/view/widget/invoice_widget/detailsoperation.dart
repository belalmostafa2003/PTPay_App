import 'package:flutter/material.dart';

class DetailsOperation extends StatelessWidget {
  const DetailsOperation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 95,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF979797)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'تم إرسال مبلغ بنجاح\nالمبلغ المرسل: 50.00 ج.م\nإلى الرقم: 01234567890',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Alexandria',
            fontWeight: FontWeight.w400,
            height: 1.56,
          ),
        ),
      ),
    );
  }
}
