import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:ptpayapp/core/widget/bottomvavigatorbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/home_widget/offer.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/home_widget/points.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 3;
  String clientName = "";
  String walletBalance = "--";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _loadAndStartPolling();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _loadAndStartPolling() async {
    final prefs = await SharedPreferences.getInstance();
    final storedUid = prefs.getString('uid') ?? '';
    if (storedUid.isEmpty) return;

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _fetchClientData(storedUid);
    });

    _fetchClientData(storedUid);
  }

  Future<void> _fetchClientData(String uid) async {
    final apiUrl = "https://ahmed80800.pythonanywhere.com/api/customers/$uid/";
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          clientName = data['name'] ?? "";
          walletBalance = data['balance']?.toString() ?? "--";
        });
      } else {
        debugPrint('Error fetching client ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      debugPrint('Exception fetching client data: $e');
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
      body: Column(
        children: [
          const SizedBox(height: 40),
          _buildHeader(),
          const SizedBox(height: 20),
          _buildWalletSection(),
          const SizedBox(height: 40),
          const PointsContainer(),
          const SizedBox(height: 20),
          OfferContainer(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar1(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset('assets/icon/notification.png', height: 26, width: 26),
        SizedBox(width: 20),
        Image.asset('assets/images/logo3.png', height: 60, width: 107),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            clientName.isEmpty ? "أهلاً" : "أهلاً, $clientName",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Alexandria',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWalletSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 380,
          height: 220,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "رصيد المحفظة",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Alexandria',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      walletBalance == "--" ? "--" : "$walletBalance جنيه",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Alexandria',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/icon/eye.png', height: 30, width: 36),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _actionButton("مشاركة QR", "assets/icon/qr.png", () {}),
                  _actionButton("تحويل أموال", "assets/icon/mobil.png", () {
                    GoRouter.of(context).push(AppRouter.KMoneyTransfer);
                  }),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -40,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRouter.KWalletTopUpPage);
              },
              child: SizedBox(
                width: 125,
                height: 125,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icon/charge.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _actionButton(String text, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
          border: Border.all( // ← هنا أضفنا الحدود
            color: Color(0xffF4B300),
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Image.asset(imagePath, height: 30, width: 30),
            const SizedBox(height: 4),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Alexandria',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
