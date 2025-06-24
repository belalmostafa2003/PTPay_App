import 'package:flutter/material.dart';

class ValidationRow extends StatelessWidget {
  final String text;
  final bool isValid;

  const ValidationRow({
    Key? key,
    required this.text,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: isValid ? Colors.green : const Color(0xff979797), // الحواف رمادية أو خضراء
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.check,
              color: isValid ? Colors.green : const Color(0xff979797), // العلامة رمادية أو خضراء
              size: 15,
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w400,
              color: isValid ? Colors.black : const Color(0xff979797),
            ),
          ),
        ],
      ),
    );
  }
}
