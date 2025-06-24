import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class OfferContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DottedBorder(
        color: Color(0xFF090909),
        strokeWidth: 6,
        dashPattern: [15, 12],
        borderType: BorderType.RRect,
        radius: Radius.circular(40),
        padding: EdgeInsets.all(0),
        child: Container(
          width: 380,
          height: 190,
          decoration: BoxDecoration(
            color: Color(0xffF4B300),
            borderRadius: BorderRadius.circular(40),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Center(
                  child: Text(
                    'الحق عرض التوفير! 🚀',
                    style: TextStyle(
                      color: Color(0xFF090909),
                      fontSize: 20,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: ' للطلاب 🎓 و للموظفين 💼.. \nوفر فلوسك مع باقات ',
                        style: TextStyle(
                          color: Color(0xFF090909),
                          fontSize: 17,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'PTPay !',
                        style: TextStyle(
                          color: Color(0xFF090909),
                          fontSize: 17,
                          fontFamily: 'Spantaran',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'باقة الـ 50 رحلة بخصم 20% – سافر أكتر وادفع أقل',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF090909),
                    fontSize: 14,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  'خصومات خاصة على الرحلات الطويلة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF090909),
                    fontSize: 14,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                    decoration: ShapeDecoration(
                     color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'اشترك الآن',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
