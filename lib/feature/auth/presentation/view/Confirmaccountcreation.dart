import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';

class ConfirmAccountCreation extends StatelessWidget {
  const ConfirmAccountCreation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                width: 110,
                height: 50,
                child: const Logo(),
              ),
              const SizedBox(height: 80),

              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: const [
                    Text(
                      "تم إنشاء الحساب",
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
                      "تم إنشاء حسابك بنجاح\n"
                          "اضغط على زر المتابعة لتوجيهك الى الصفحة الرئيسية\n"
                          "يرجى الذهاب الى أقرب فرع لاستلام كارت ال NFC الخاص بك",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              Container(
                width: size.width * 0.3,
                height: size.width * 0.3,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/icon.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 150),

              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.KSureSecurity);
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
        ),
      ),
    );
  }
}
