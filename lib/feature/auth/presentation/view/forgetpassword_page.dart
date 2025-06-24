import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/forgetpassword_widgets/oTPSubmitButton.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  String get otp =>
      _otpControllers.map((controller) => controller.text).join();

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = otp.length == 4;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            SizedBox(height: 50, width: 110, child: const Logo()),
            const SizedBox(height: 35),
            const Text(
              "سوف يتم إرسال رسالة نصية على رقم هاتفك الخاص\n01063227758",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Alexandria',
                height: 2,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'ادخل الكود المكون من 6  ارقام',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF979797),
                fontSize: 12,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            const SizedBox(height: 30),
            // ✅ مربعات OTP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.ltr, // ← يبدأ من الشمال
              children: List.generate(4, (index) {
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: TextFormField(
                    controller: _otpControllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    maxLength: 1,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      counterText: "",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffF4B300), width: 3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xffF4B300), width: 3),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < _otpControllers.length - 1) {
                          FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                        } else {
                          FocusScope.of(context).unfocus(); // ← لما يخلص كل الأرقام يقفل الكيبورد
                        }
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // إعادة الإرسال
                  },
                  child: const Text(
                    "00:32",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Alexandria',
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  "اعادة إرسال خلال",
                style: TextStyle(
                  color: Color(0xff979797),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Alexandria',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 110),
            OTPSubmitButton(
              isEnabled: isFormValid,
              onSubmit: () {
                GoRouter.of(context).push(AppRouter.KResetPassword);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
