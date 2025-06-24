import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Text("رصيد المحفظة",
              style: TextStyle(color: Colors.white, fontSize: 17,fontFamily: 'Alexandria')),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icon/eye.png",width: 25,height: 25,),
              const SizedBox(width: 15),
              const Text("88.5 جنيه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,fontFamily: 'Alexandria')),
            ],
          )
        ],
      ),
    );
  }
}