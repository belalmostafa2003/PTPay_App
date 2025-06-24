// File: lib/feature/account/presentation/view/my_account_screen.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ptpayapp/core/widget/build_Info_tile_account.dart';
import 'package:ptpayapp/core/widget/build_section_title_account.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';
import 'package:ptpayapp/core/widget/profile_header_account.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  String _name = '';
  String _nationalId = '';
  String _cardUid = '';
  String _governorate = '';
  String _city = '';
  String _phone = '';
  String _email = '';
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final uid = prefs.getString('uid') ?? '';
      if (uid.isEmpty) {
        setState(() {
          _errorMessage = 'لم يتم العثور على UID.';
          _isLoading = false;
        });
        return;
      }

      final url = Uri.parse('https://ahmed80800.pythonanywhere.com/api/customers/$uid/');
      final response = await http.get(url);

      if (response.statusCode != 200) {
        setState(() {
          _errorMessage = 'فشل جلب البيانات (${response.statusCode}).';
          _isLoading = false;
        });
        return;
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        _name        = data['name']        ?? '';
        _nationalId  = data['national_id'] ?? '';
        _cardUid     = data['uid']         ?? '';
        _governorate = data['governorate']?.toString() ?? '';
        _city        = data['city']       ?.toString() ?? '';
        _phone       = data['phone']       ?? '';
        _email       = data['email']       ?? '';
        _isLoading   = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'حدث خطأ: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _errorMessage != null
            ? Center(child: Text(_errorMessage!))
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomAppBar(title: 'حسابي'),
              ProfileHeader(
                name: _name,
                initialImagePath: 'assets/images/my_photo.jpg',
              ),
              buildSectionTitle("إعدادات الحساب"),
              buildInfoTile("الإسم الكامل", _name),
              buildInfoTile("الرقم القومي", _nationalId),
              buildInfoTile("Card UID", _cardUid),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: buildSmallInfoTile(
                        "المحافظة*",
                        _governorate,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildSmallInfoTile(
                        "المدينة*",
                        _city,
                      ),
                    ),
                  ],
                ),
              ),
              buildInfoTile("رقم الهاتف", _phone),
              buildInfoTile("البريد الإلكتروني", _email,
                  isBold: true),
              buildInfoTile("كلمة المرور", "",
                  buttonText: "تغيير", onButtonTap: () {
                    // TODO: Navigate to change password screen
                  }),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                    horizontal: 60, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding:
                    const EdgeInsets.symmetric(vertical: 22),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Text("تم",
                      style: TextStyle(
                          fontSize: 22, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}