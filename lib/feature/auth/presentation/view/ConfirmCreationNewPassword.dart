import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';

class ConfirmCreationNewPassword extends StatelessWidget {
  const ConfirmCreationNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                  height: 50,
                  width: 110,
                  child: const Logo()),
              const SizedBox(height: 90),
              Center(
                child: const Text(
                  "تم تغيير كلمة المرور بنجاح",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: 'Alexandria',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: const Text(
                  "يمكنك الآن تسجيل الدخول باستخدام كلمة المرور الجديدة",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Alexandria',
                    fontWeight: FontWeight.w400,
                    color: Color(0xff979797),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Container(
                width: 75.52,
                height: 107.99,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/iconkey.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 80,),
              InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.KChooseLocationFirst);
                },
                child: Container(
                  width: 280,
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
                        fontSize: 18,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.80,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
