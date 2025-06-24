import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const OptionCard({
    super.key,
    required this.image,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Color(0xffF4B300) : Colors.black,
                width: 3,
              ),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xff979797),
              fontWeight: FontWeight.w600,
              fontFamily: 'Alexandria',
            ),
          ),
        ],
      ),
    );
  }
}
