// lib/feature/home/presentation/view/TripDetailsPage.dart

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';

class TripDetailsPage extends StatelessWidget {
  final int tripNumber;
  final String from;
  final String to;
  final String dateTime;
  final double price;
  final String vehicleNumber;
  final double balance;
  final String token;

  const TripDetailsPage({
    Key? key,
    required this.tripNumber,
    required this.from,
    required this.to,
    required this.dateTime,
    required this.price,
    required this.vehicleNumber,
    required this.balance,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                GoRouter.of(context).push(AppRouter.KQRScanPageRider);
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,size: 16,),
                  SizedBox(width: 3,),
                  Text("عودة",
                    style: TextStyle(fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Alexandria',
                    ),),
                ],
              ),
            ),
            Container(
                height: 50,
                width: 110,
                child: const Logo()),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تفاصيل الرحلة',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w400,
                    height: 1.04,
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 210,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: DottedBorder(
                  color: Colors.black,
                  dashPattern: [15, 12],
                  strokeWidth: 3,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(30),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('رقم الرحلة: $tripNumber',
                          style: TextStyle(fontFamily: 'Alexandria',
                          fontSize: 16 ,fontWeight: FontWeight.w400),),
                        SizedBox(height: 8),
                        Text('من - إلى: $from ← $to',
                          style: TextStyle(fontFamily: 'Alexandria',
                              fontSize: 16 ,fontWeight: FontWeight.w400),),
                        SizedBox(height: 8),
                        Text('تاريخ الرحلة: $dateTime',
                          style: TextStyle(fontFamily: 'Alexandria',
                              fontSize: 16 ,fontWeight: FontWeight.w400),),
                        SizedBox(height: 8),
                        Text('سعر الرحلة: ${price.toStringAsFixed(0)} ج.م',
                          style: TextStyle(fontFamily: 'Alexandria',
                              fontSize: 16 ,fontWeight: FontWeight.w400),),
                        SizedBox(height: 8),
                        Text('رقم المركبة: $vehicleNumber',
                          style: TextStyle(fontFamily: 'Alexandria',
                              fontSize: 16 ,fontWeight: FontWeight.w400),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.KReportProblemPage,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffE40408),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child: Text(
                      'الإبلاغ عن مشكلة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.KPaymentDetailsPage,
                        extra: {
                          'price': price,
                          'fee': 2.0,
                          'total': price + 2.0,
                          'balance': balance,       // هذه القيمة هي رصيد المحفظة
                          'tripNumber': tripNumber,
                          'token': token,
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF4B300),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    child: Text(
                      'ادفع الآن',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
