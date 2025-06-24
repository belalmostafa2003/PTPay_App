import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const CustomAppBar(title: 'الدعم والمساعدة'),
                const SizedBox(height: 30),

                // الأزرار
                buildSupportButton("أسئلة شائعة (FAQ)", onTap: () {}),
                buildSupportButton("محادثة مباشرة مع الدعم", onTap: () {}),
                buildSupportButton("طلب دعم جديد", onTap: () {}),
                buildSupportButtonWithIcon(
                    "PTPay", 'assets/icon/facebook.png',
                    onTap: () {}),
                buildSupportButtonWithIcon(
                    "PTPay@gamil.com", 'assets/icon/gmail.png',
                    onTap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSupportButton(String text, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }

  Widget buildSupportButtonWithIcon(String text, String imagePath,
      {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagePath, height: 24, width: 24),
              Text(
                text,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
