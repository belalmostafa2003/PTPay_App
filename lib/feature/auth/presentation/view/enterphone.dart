import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/forgetpassword_widgets/oTPNumberPad.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/forgetpassword_widgets/oTPenterpassword.dart';

class EnterPhone extends StatefulWidget {
  const EnterPhone({super.key});

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String otp = "";

  void _onNumberPressed(String number) {
    if (otp.length < 11) {
      setState(() {
        otp += number;
        _phoneController.text = otp;
      });
    }
  }

  void _onDelete() {
    if (otp.isNotEmpty) {
      setState(() {
        otp = otp.substring(0, otp.length - 1);
        _phoneController.text = otp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = otp.length == 11;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                SizedBox(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.3,
                  child: const Logo(),
                ),
                SizedBox(height: screenHeight * 0.04),
                const Text(
                  "أدخل رقم هاتفك المحمول",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Alexandria',
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                const Text(
                  "سوف يتم ارسال رسالة نصية على رقم هاتفك الخاص",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff979797),
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Alexandria',
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.none,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    hintText: "رقم الهاتف",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: screenHeight * 0.10),
                OTPNumberPad(onNumberPressed: _onNumberPressed, onDelete: _onDelete),
                SizedBox(height: screenHeight * 0.05),
                oTPenterpassword(
                  isEnabled: isFormValid,
                  onSubmit: () {
                    GoRouter.of(context).push(AppRouter.KForgetpassword);
                  },
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
