import 'package:flutter/material.dart';

class TextformMoney extends StatefulWidget {
  final TextEditingController phoneController;
  final TextEditingController moneyController;
  final void Function(String phone, String amount) onDataEntered;

  const TextformMoney({
    super.key,
    required this.phoneController,
    required this.moneyController,
    required this.onDataEntered,
  });

  @override
  State<TextformMoney> createState() => _TextformMoneyState();
}

class _TextformMoneyState extends State<TextformMoney> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          /// ✅ رقم الهاتف بنفس محاذاة "مسح QR كود"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "مسح QR كود",
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Text(
                "رقم الهاتف",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Alexandria',
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  "assets/icon/quyr.png",
                  height: 40,
                  width: 40,
                ),
              ),
              SizedBox(width: 65,),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40,
                  width: 222,
                  child: TextFormField(
                    controller: widget.phoneController,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: '01234567890',
                      hintStyle: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w500,
                        color: Color(0xff979797),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 35),

          const Text(
            "إدخال مبلغ التحويل",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SizedBox(
                height: 40,
                width: 222,
                child: TextFormField(
                  controller: widget.moneyController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: '100.0 ج.م',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w500,
                      color: Color(0xff979797),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
