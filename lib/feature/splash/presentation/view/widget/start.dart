import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/splash/presentation/view/widget/languageButton.dart';
import 'dart:ui';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // التحكم في مقدار التشويش
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 50,
                          width: 110,
                          child: const Logo()),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        'وسيلتك الأسهل للدفع\nفي وسائل الموصلات.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w600,
                          height: 1.80,
                          letterSpacing: 0.75,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Color(0xFF000000).withOpacity(0.25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LanguageButton(
                        text: "English",
                        onPressed: () => GoRouter.of(context).push(AppRouter.KOnBoardingScreen),
                      ),
                      SizedBox(width: 15),
                      LanguageButton(
                        text: "عربى",
                        onPressed: () => GoRouter.of(context).push(AppRouter.KOnBoardingScreen),
                      ),
                    ],
                  ),
                  SizedBox(height: 90),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
