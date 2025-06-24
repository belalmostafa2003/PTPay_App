import 'package:flutter/material.dart';

class InformationCar extends StatelessWidget {
  final VoidCallback onStartTrip;
  final VoidCallback onStopTrip;
  final bool isLoading;
  final bool canStart;
  final bool canStop;
  final bool isTripActive;
  final int? activeSequence;
  final String? activeRouteName;
  final String? activeStartTime;

  const InformationCar({
    Key? key,
    required this.onStartTrip,
    required this.onStopTrip,
    this.isLoading = false,
    this.canStart = false,
    this.canStop = false,
    this.isTripActive = false,
    this.activeSequence,
    this.activeRouteName,
    this.activeStartTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (activeSequence != null)
            Text(
              'رقم الرحلة: $activeSequence\n'
                  'سعر الرحلة : 7 ج.م\n'
                  '${activeRouteName ?? ''}\n'
                  'وقت البدء: ${activeStartTime ?? ''}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            )
          else
            const Text(
              'اضغط "بدء الرحلة" لعرض التفاصيل هنا',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontFamily: 'Alexandria',
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          const SizedBox(height: 20),
          SizedBox(
            width: 140,
            height: 36,
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : isTripActive
                  ? (canStop ? onStopTrip : null)
                  : (canStart ? onStartTrip : null),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                backgroundColor: const Color(0xffF4B300),
              ),
              child: isLoading
                  ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
                  : Text(
                isTripActive ? 'إيقاف الرحلة' : 'بدء الرحلة',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}