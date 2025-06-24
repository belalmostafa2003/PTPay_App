import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  final TextEditingController otpController;
  final String otp;
  const OTPInputField({
    Key? key,
    required this.otpController,
    required this.otp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            "أدخل الكود المكون من 6 أرقام",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff979797),
                fontWeight: FontWeight.w400,
                fontFamily: 'Alexandria'),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: otpController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 6,
          style: const TextStyle(
              fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'Alexandria'),
          readOnly: true,
          decoration: const InputDecoration(
            counterText: "",
            hintText: "XXX-XXX",
            hintStyle: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w400,
              color: Color(0xff979797),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFF6A00), width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffFF6A00), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
