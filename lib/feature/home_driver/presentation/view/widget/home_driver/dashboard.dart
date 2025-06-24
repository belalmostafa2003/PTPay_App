import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final List<dynamic> payments;
  final VoidCallback onRefresh;
  static const int tripFare = 7;

  const Dashboard({
    Key? key,
    this.payments = const [],
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;
    final int passengerCount = payments.length;

    return Container(
      width: sw * .92,
      constraints: BoxConstraints(
        maxHeight: sh * .45,
        minHeight: 220,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 2),
        color: const Color(0xffF4B300),
      ),
      child: Column(
        children: [
          // الهيدر
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'حالة الدفع لكل راكب',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'عدد الركاب: $passengerCount',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Alexandria',
                      ),
                    ),
                  ],
                ),
                // زر التحديث إذا أردته لاحقاً
                // IconButton(icon: Icon(Icons.replay), onPressed: onRefresh)
              ],
            ),
          ),

          // قائمة الدفعات
          Expanded(
            child: payments.isEmpty
                ? const Center(child: Text('لا توجد دفعات بعد'))
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final p      = payments[index];
                final seq    = p['trip']['sequence_number'];
                final name   = p['customer_name'] ?? '';
                const int fare = tripFare;
                final method = (p['payment_method'] as String).toLowerCase();

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: .5, color: Color(0xFF979797)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'رقم الرحلة: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Alexandria',
                                  ),
                                ),
                                TextSpan(
                                  text: '$seq',
                                  style: const TextStyle(
                                    color: Color(0xFFFF6A00),
                                    fontSize: 14,
                                    fontFamily: 'Alexandria',
                                  ),
                                ),
                                TextSpan(
                                  text: ' | $name',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Alexandria',
                                  ),
                                ),
                                TextSpan(
                                  text: ' | $fare EGP',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Alexandria',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: [
                          Image.asset(
                            method == 'nfc'
                                ? "assets/icon/img_1.png"
                                : "assets/icon/img.png",
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 6),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/icon/sah.png',
                                  height: 25, width: 25),
                              const SizedBox(height: 2),
                              const Text(
                                'مدفوع',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black,
                                  fontFamily: 'Alexandria',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}