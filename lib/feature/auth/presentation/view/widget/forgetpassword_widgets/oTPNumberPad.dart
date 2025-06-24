import 'package:flutter/material.dart';

class OTPNumberPad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final Function onDelete;

  const OTPNumberPad({
    Key? key,
    required this.onNumberPressed,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) {
          return const SizedBox.shrink();
        } else if (index == 11) {
          return IconButton(
            onPressed: () => onDelete(),
            icon: const Icon(Icons.backspace_outlined, size: 28),
          );
        } else {
          String number = index == 10 ? "0" : (index + 1).toString();
          return GestureDetector(
            onTap: () => onNumberPressed(number),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                number,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }
      },
    );
  }
}
