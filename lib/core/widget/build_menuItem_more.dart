import 'package:flutter/material.dart';

Widget buildMenuItem(
      BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,fontFamily: 'Alexandria'),
              ),
            ),
          ],
        ),
      ),
    );
  }