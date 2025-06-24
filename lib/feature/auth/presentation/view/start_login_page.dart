import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';

class StartLoginPage extends StatelessWidget {
  const StartLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 300),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'PT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontFamily: 'Spantaran',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              const Color(0xFFF4D800).withOpacity(0.8),
                              const Color(0xFFFF6A00).withOpacity(0.8),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: 34,
                            fontFamily: 'Spantaran',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        ' مرحبا بك في',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    '.ابدأ رحلتك مع الدفع السهل والسريع',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff979797),
                      fontSize: 20,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
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
                              'تسجيل الدخول',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Alexandria',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height:25),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.KChooseLocationSecond);
                        },
                        child: Container(
                          width: 300,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xffF4B300),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'إنشاء حساب',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF090909),
                                fontSize: 20,
                                fontFamily: 'Alexandria',
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.80,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
