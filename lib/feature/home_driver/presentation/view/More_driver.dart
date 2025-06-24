import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/bottomvavigatorbar.dart';
import 'package:ptpayapp/core/widget/build_menuItem_more.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';
import 'package:ptpayapp/feature/home_driver/presentation/view/widget/home_driver/bottomvavigatordriver.dart';

class MoreDriver extends StatefulWidget {
  final String driverId;
  final String token;
  const MoreDriver({
    Key? key,
    required this.driverId,
    required this.token,
  }) : super(key: key);

  @override
  State<MoreDriver> createState() => _MoreDriverState();
}

class _MoreDriverState extends State<MoreDriver> {
  late final Dio _dio;
  String? driverName;
  String? photoUrl;
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(
      baseUrl: 'https://ahmed80800.pythonanywhere.com/api/',
      headers: {
        'Authorization': 'Bearer ${widget.token}',
        'Content-Type': 'application/json',
      },
    ));
    _fetchDriverProfile();
  }

  Future<void> _fetchDriverProfile() async {
    final resp = await _dio.get('driver/${widget.driverId}/');
    if (resp.statusCode == 200) {
      final data = resp.data as Map<String, dynamic>;
      setState(() {
        driverName = data['name'] as String?;
        photoUrl   = data['driver_photo'] as String?;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        context.go(AppRouter.KHomepageDriver);
        break;
      case 1:
        context.go(AppRouter.KInvoicelistDriver);
        break;
      case 2:
        context.go('/trips');
        break;
      case 3:
      // already here
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'المزيد'),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundImage: photoUrl != null
                  ? NetworkImage(photoUrl!)
                  : const AssetImage('assets/icon/personal.png') as ImageProvider,
            ),
            const SizedBox(height: 10),
            Text(
              driverName ?? 'جاري التحميل…',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  buildMenuItem(
                    context,
                    'حسابي',
                    'assets/icon/myacount.png',
                        () {
                      GoRouter.of(context).push(AppRouter.KDriverAccount);
                    },
                  ),
                  buildMenuItem(
                    context,
                    'المحفظه المالية',
                    'assets/icon/mahfza.png',
                        () {
                      GoRouter.of(context).push(AppRouter.KWalletPage);
                    },
                  ),
                  buildMenuItem(context, 'رحلاتي السابقة', 'assets/icon/historytrip.png',
                          () => context.push(AppRouter.KInvoicelistDriver)),
                  buildMenuItem(context, 'الإحصائيات', 'assets/icon/simatic.png',
                          () => GoRouter.of(context).push(AppRouter.KDriverStatisticsScreen)),
                  buildMenuItem(context, 'الإشعارات', 'assets/icon/not.png',
                          () => GoRouter.of(context).push(AppRouter.KDriverNotificationsScreen)),
                  buildMenuItem(context, 'الدعم والمساعدة', 'assets/icon/support.png',
                          () => context.push('/support')),
                  buildMenuItem(context, 'إعدادات التطبيق', 'assets/icon/settin.png',
                          () => context.push('/settings')),
                  buildMenuItem(context, 'شروط الخدمة وسياسة الخصوصية', 'assets/icon/pc.png',
                          () => context.push('/privacy')),
                  buildMenuItem(context, 'تسجيل الخروج', 'assets/icon/ecs.png',
                          () => context.push('/login')),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}