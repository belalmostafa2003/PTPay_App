import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';

class SureSecurity extends StatelessWidget {
  const SureSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // يخلي كل شيء في النص أفقيًا
          children: [
            const SizedBox(height: 50),

            // اللوجو فوق
            Center(
              child: SizedBox(
                width: 110,
                height: 50,
                child: Logo(),
              ),
            ),

            const SizedBox(height: 90),

            // باقي الصفحة في النص
            Column(
              mainAxisAlignment: MainAxisAlignment.center, // وسط عموديًا
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: const [
                      Text(
                        "شكرًا لتأكيد حسابك",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Alexandria',
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'جاري مراجعة بيانات السائق،\nسيتم إشعارك فور انتهاء المراجعة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: Image(
                    image: AssetImage('assets/images/waiting.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 120),
                InkWell(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.KChooseLocationFirst);
                  },
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'متابعة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
