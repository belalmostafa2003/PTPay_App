import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';

class CustomBottomNavBar1 extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar1({ 
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 80,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _navBarItem("المزيد", "assets/icon/moree.png", 0),
              _navBarItem("عروض", "assets/icon/offeer.png", 1),
              const SizedBox(width: 80),
              _navBarItem("السجل", "assets/icon/histo.png", 2),
              _navBarItem("الرئيسية", "assets/icon/main.png", 3),
            ],
          ),
        ),
        Positioned(
          top: -15,
          left: 152,
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.KQRScanPageRider);
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icon/qq.png",
                  width: 70,
                  height: 70,
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
