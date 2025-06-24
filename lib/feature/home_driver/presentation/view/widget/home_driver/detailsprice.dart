import 'package:flutter/material.dart';

class DetailsPrice extends StatelessWidget {
  const DetailsPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final double collected = 225;
    final double total     = 300;
    final double progress  = (collected / total).clamp(0.0, 1.0);

    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _row('المدفوع: 15', const Icon(Icons.check, color: Colors.white, size: 16),
              bg: const Color(0xff4DA66B)),
          const SizedBox(height: 4),
          _row('المتبقي: 5',
              Image.asset("assets/icon/people.png", height: 20, width: 20)),
          const SizedBox(height: 4),
          _row('الإجمالي: 20', const Icon(Icons.close, color: Colors.white, size: 16),
              bg: Colors.red),
        ],
      ),
    );
  }

  Widget _row(String text, Widget icon, {Color? bg}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'Alexandria',
            fontWeight: FontWeight.w500,
            height: 1.43,
          ),
        ),
        const SizedBox(width: 2),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: bg ?? Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(child: icon),
        ),
      ],
    );
  }
}