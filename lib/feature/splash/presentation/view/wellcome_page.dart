import 'package:flutter/material.dart';
import 'dart:async';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';

class WellcomePage extends StatefulWidget {
  @override
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.KStartScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0E0E10),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 88,
                      width: 172,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Alexandria',
                    ),
                    children: [
                      const TextSpan(
                        text: 'في مصر',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Alexandria',
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' ',
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xffF4D800), Color(0xffFF6A00)],
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'موصلاتك',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Alexandria',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
