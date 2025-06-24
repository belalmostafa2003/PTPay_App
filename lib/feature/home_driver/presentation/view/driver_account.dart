import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/build_Info_tile_account.dart';
import 'package:ptpayapp/core/widget/build_section_title_account.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';
import 'package:ptpayapp/core/widget/profile_header_account.dart';

class DriverAccount extends StatelessWidget {
  const DriverAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(title: 'حسابي'),
              const ProfileHeader(
                name: 'وائل منصور',
                initialImagePath: 'assets/images/profile_photo.png',
              ),
              // إعدادات الحساب
              buildSectionTitle("إعدادات الحساب"),
              buildInfoTile("الإسم الكامل", "وائل منصور محمد"),
              buildInfoTile("الرقم القومي", "12345678901234"),
              buildInfoTile("رقم الهاتف", "01234567890"),
              buildInfoTile("البريد الإلكتروني", "wael.mansor@gmail.com"),
              buildInfoTile("كلمة المرور", "********", buttonText: "تغيير"),

              // معلومات المركبة
              buildSectionTitle("معلومات المركبة"),
              buildInfoTile("رقم الرخصة", "D/1234567"),

              // نوع المركبة ورقم المركبة مع بعض
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: buildSmallInfoTile("نوع المركبة", "ميكروباص")),
                    const SizedBox(width: 10),
                    Expanded(
                        child:
                            buildSmallInfoTile("رقم المركبة", "1234 | ب ص ج")),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // زر "تم"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "تم",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
