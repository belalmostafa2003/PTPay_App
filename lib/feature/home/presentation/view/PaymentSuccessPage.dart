import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';

class PaymentSuccessPage extends StatelessWidget {
  final int    tripNumber;
  final double amount;
  final double newBalance ;
  final String dateTime;

  const PaymentSuccessPage({
    Key? key,
    required this.tripNumber,
    required this.amount,
    required this.newBalance ,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
                width: 110,
                height: 50,
                child: const Logo()),
            const SizedBox(height: 33),
            Image.asset('assets/icon/true.png', width: 125, height: 125),
            const SizedBox(height: 30),
            Directionality(
              textDirection: TextDirection.rtl,
              child: const Text(
                'تم الدفع بنجاح! ',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w400,
                ),
              )
            ),
            const SizedBox(height: 40),
            DottedBorder(
              color: Colors.black,
              dashPattern: const [10, 10],
              strokeWidth: 3,
              borderType: BorderType.RRect,
              radius: const Radius.circular(30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('رقم الرحلة: $tripNumber',style: const TextStyle(
                        fontFamily: 'Alexandria',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),),
                      const SizedBox(height: 8),
                      Text('تم خصم: ${amount.toStringAsFixed(0)} ج.م',style: const TextStyle(
                        fontFamily: 'Alexandria',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),),
                      const SizedBox(height: 8),
                      // هنا نعرض الرصيد بعد الخصم
                      Text(
                        'رصيدك الحالي: ${newBalance .toStringAsFixed(0)} ج.م',
                        style: const TextStyle(
                          fontFamily: 'Alexandria',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('تاريخ الدفع: $dateTime',style: const TextStyle(
                        fontFamily: 'Alexandria',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: const Text(
                    'رصيدك الحالي',
                    style: TextStyle(
                      fontFamily: 'Alexandria',
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      '${newBalance.toStringAsFixed(0)} ج.م',
                      style: const TextStyle(
                        fontFamily: 'Alexandria',
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // تنزيل الفاتورة
                    },
                    icon: const Icon(Icons.sim_card_download_outlined, color: Colors.white),
                    label: const Text(
                      '    تنزيل الفاتورة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFFBBC05),
                        fontSize: 15,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // حواف دائرية
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => GoRouter.of(context).go(AppRouter.KHomepage),
                    icon: const Icon(Icons.share, color: Colors.white),
                    label: const Text(
                      '    مشاركة الفاتورة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFFBBC05),
                        fontSize: 15,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // حواف دائرية
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}