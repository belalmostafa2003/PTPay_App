import 'package:flutter/material.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 90,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/logo3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
