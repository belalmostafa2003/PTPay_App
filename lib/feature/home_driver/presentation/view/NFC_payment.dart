import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class NFCPaymentScreen extends StatelessWidget {
  const NFCPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'NFC الدفع عبر'),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        'مرر الكارت أو الهاتف لإتمام الدفع',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Image.asset(
                        'assets/images/img_11.png',
                        height: 72,
                        width: 80,
                      ),
                      const SizedBox(height: 16),

                      // ✅ الدفع الناجح
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PaymentText(
                                    text: 'تم الدفع بنجاح!',
                                  ),
                                  PaymentText(text: 'المبلغ: 15 ج.م'),
                                  PaymentText(text: 'الراكب: أحمد سالم'),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/icon/true.png',
                              height: 50,
                              width: 50,
                            ),
                          ],
                        ),
                      ),

                      // ❌ الدفع الفاشل
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PaymentText(
                                        text: 'فشل الدفع !!!',
                                        color: Colors.red,
                                      ),
                                      PaymentText(text: 'الراكب: محمود علي'),
                                      PaymentText(
                                          text:
                                              'رصيد غير كافي أو مشكلة في البطاقة.'),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                                const Icon(Icons.cancel,
                                    color: Colors.red, size: 50),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'حاول مجددًا',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10,fontFamily: 'Alexandria'),
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.attach_money,
                                      color: Colors.amber),
                                  label: const Text('تحصيل الدفع نقدًا',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10,fontFamily: 'Alexandria')),
                                ),
                                Spacer(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ✅ Widget مخصصة لعرض النص مع spacing جيد وتنسيق موحد
class PaymentText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  const PaymentText({
    super.key,
    required this.text,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4), // ← spacing بين الأسطر
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          height: 1.2, // ← line height
          color: color ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: 'Alexandria'
        ),
      ),
    );
  }
}
