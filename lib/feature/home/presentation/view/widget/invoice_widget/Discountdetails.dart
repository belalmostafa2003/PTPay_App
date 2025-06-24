import 'package:flutter/material.dart';

class DiscountDetails extends StatelessWidget {
  const DiscountDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 120,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFF979797)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Directionality(
        textDirection: TextDirection.rtl,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'تفاصيل الخصم:\nالمبلغ المرسل: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              TextSpan(
                text: '-50.00 ',
                style: TextStyle(
                  color: Color(0xFFEB001B),
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              TextSpan(
                text: 'ج.م\nرسوم الخدمة: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              TextSpan(
                text: '-2.00 ',
                style: TextStyle(
                  color: Color(0xFFEB001B),
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              TextSpan(
                text: 'ج.م\nالإجمالي المخصوم: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              TextSpan(
                text: '-52.00 ',
                style: TextStyle(
                  color: Color(0xFFEB001B),
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
              TextSpan(
                text: 'ج.م',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                  height: 1.56,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}
