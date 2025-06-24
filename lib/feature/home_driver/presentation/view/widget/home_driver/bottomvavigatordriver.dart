import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  static const double _barHeight = 80;

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: _barHeight,
          decoration: const BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navBarItem("الرئيسية", "assets/icon/main.png", 0),
              _navBarItem("السجل", "assets/icon/histo.png", 1),
              const SizedBox(width: 80), // مكان الزر العائم
              _navBarItem("التحصيل", "assets/icon/tahsil.png", 2),
              _navBarItem("المزيد", "assets/icon/moree.png", 3),
            ],
          ),
        ),
        Positioned(
          top : -_barHeight / 2,
          left: (sw / 2) - 40, // 40 = نصف قطر الزر (80/2)
          child: GestureDetector(
            onTap: () => context.push(AppRouter.KQRScanPageDriver),
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icon/qq.png",
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _navBarItem(String title, String iconPath, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, width: 26, height: 26),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'Alexandria',
            ),
          ),
        ],
      ),
    );
  }
}