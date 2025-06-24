import 'package:flutter/material.dart';

class PointsContainer extends StatelessWidget {
  const PointsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 180,
      padding:const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '150',
                          style: TextStyle(
                            color: Color(0xFFF4B300),
                            fontSize: 15,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' نقطة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(width: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    'نقاطك الحالية🎯',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Stack(
              children: [
                Container(
                  height: 9,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 9,
                      width: 250 * 0.2,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
                        color: Colors.white,
                      ),
                    ),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xFFF4D800), Color(0xFFFF6A00)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds);
                      },
                      child: Container(
                        height: 9,
                        width: 250 * 0.8,
                        decoration:const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Directionality(
            textDirection: TextDirection.rtl,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '50',
                    style: TextStyle(
                      color: Color(0xFFF4B300),
                      fontSize: 12,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: ' نقطة للحصول على رحلة مجانية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 90,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color(0xffF4B300),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:const Center(
                        child: Text(
                          'استبدل الآن',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  '50   نقطة  = خصم 10 جنيه.\n100 نقطة  = خصم 25 جنيه.\n200 نقطة = رحلة مجانية.',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}