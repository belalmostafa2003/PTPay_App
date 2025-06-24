import 'package:flutter/material.dart';
class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xffFF6A00),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.flip(
                  flipX: true,
                  child: const Icon(Icons.sim_card_download_outlined, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 3),
                const Text(
                  "تنزيل الفاتورة",
                  style: TextStyle(fontFamily: 'Alexandria', fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          const SizedBox(width: 25),
          Container(
            width: 150,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xffFF6A00),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.share_outlined, color: Colors.white, size: 18),
                const SizedBox(width: 3),
                const Text(
                  "مشاركة الفاتورة",
                  style: TextStyle(fontFamily: 'Alexandria', fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
