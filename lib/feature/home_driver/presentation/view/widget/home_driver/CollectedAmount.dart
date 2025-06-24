import 'package:flutter/material.dart';

class CollectedAmountContainer extends StatelessWidget {
  final double collected;
  final double pending;

  const CollectedAmountContainer({
    super.key,
    required this.collected,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    final double total    = collected + pending;
    final double progress = (collected / (total == 0 ? 1 : total)).clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          height: 100,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // الرقم المحصّل
              Row(
                children: [
                  const Text(
                    'المبلغ المُحصل',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const Spacer(),
                  Text(
                    '${collected.toInt()} ج.م',
                    style: const TextStyle(
                      color: Color(0xFFFF6A00),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // شريط التقدم
              Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerRight,
                    widthFactor: progress,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF6A00), Color(0xFFF4D800)],
                          begin: Alignment.bottomCenter,
                          end  : Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'المبلغ المُعلق: ${pending.toInt()} ج.م',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}