import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/widget/build_menuItem_more.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/bottomvavigatorbar.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;
  String name = '';
  String phone = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadAndFetchProfile();
  }

  Future<void> _loadAndFetchProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid') ?? '';
    if (uid.isEmpty) return;
    final url = 'https://ahmed80800.pythonanywhere.com/api/customers/$uid/';
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      setState(() {
        name  = data['name']  ?? '';
        phone = data['phone'] ?? '';
        email = data['email'] ?? '';
      });
    }
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0: // المزيد
        GoRouter.of(context).push(AppRouter.KProfileScreen);
        break;
      case 1: // عروض
        GoRouter.of(context).push(AppRouter.KOffersScreen);
        break;
      case 2: // السجل
        GoRouter.of(context).push(AppRouter.KInvoiceListScreen);
        break;
      case 3: // الرئيسية
        setState(() {
          _selectedIndex = index;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).pop(),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        const Text(
                          'عودة',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Alexandria',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/logo3.png',
                    height: 40,
                  ),
                  const Spacer(flex: 2),
                ],
              ),
              const SizedBox(height: 24),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                  'assets/images/SampleGeorge.jpg', // استبدلها برابط الصورة الحقيقي
                ),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: 12),
              Text(
                name.isEmpty ? '...' : name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Alexandria',
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    buildMenuItem(
                      context,
                      'حسابي',
                      'assets/icon/myacount.png',
                          () {
                            GoRouter.of(context).push(AppRouter.KMyAccountScreen);
                          },
                    ),
                    buildMenuItem(
                      context,
                      'محفظتي',
                      'assets/icon/mahfza.png',
                          () => GoRouter.of(context).push(AppRouter.KWalletPage), 
                    ),
                    buildMenuItem(
                      context,
                      'رحلاتي السابقة',
                      'assets/icon/historytrip.png',
                          () => GoRouter.of(context).push(AppRouter.KInvoiceListScreen),
                    ),
                    buildMenuItem(
                      context,
                      'العروض والخصومات',
                      'assets/icon/offerfire.png',
                          () => GoRouter.of(context).push(AppRouter.KOffersScreen),
                    ),
                    buildMenuItem(
                      context,
                      'الإشعارات',
                      'assets/icon/not.png',
                          () {
                            GoRouter.of(context).push(AppRouter.KNotificationsScreen);
                          },
                    ),
                    buildMenuItem(
                      context,
                      'الدعم والمساعدة',
                      'assets/icon/support.png',
                          () {
                            GoRouter.of(context).push(AppRouter.KSupportScreen);
                          },
                    ),
                    buildMenuItem(
                      context,
                      'إعدادات التطبيق',
                      'assets/icon/settin.png',
                          () {},
                    ),
                    buildMenuItem(
                      context,
                      'شروط الخدمة وسياسة الخصوصية',
                      'assets/icon/pc.png',
                          () {},
                    ),
                    buildMenuItem(
                      context,
                      'تسجيل الخروج',
                      'assets/icon/ecs.png',
                          () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar1(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}