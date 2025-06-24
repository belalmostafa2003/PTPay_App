import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/widget/bottomvavigatorbar.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // التنقل حسب التبويب
    switch (index) {
      case 0:
        context.push('/');
        break;
      case 1:
        context.push('/OffersScreen');
        break;
      case 2:
        context.push('/InvoiceListScreen');
        break;
      case 3:
        context.push('/home');
        break;
      case 4:
        context.push('/qr');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'العروض والخصومات'),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        "🔥 العروض الحصرية",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _buildOfferCard(
                            "خصم 25% على أول 3 رحلات!",
                            "سافر أرخص مع PTPay! 🚀\nأول 3 رحلات ليك عليها خصم 25% عند الدفع بالمحفظة الإلكترونية\nالعرض ساري حتى: 30 إبريل 2025",
                          ),
                          _buildOfferCard(
                            "خصم 25% على أول 3 رحلات!",
                            "سافر أرخص مع PTPay! 🚀\nأول 3 رحلات ليك عليها خصم 25% عند الدفع بالمحفظة الإلكترونية\nالعرض ساري حتى: 30 إبريل 2025",
                          ),
                          _buildOfferCard(
                            "اشترك في باقة الـ 50 رحلة بخصم 20%!",
                            "بدل ما تدفع كل مرة، اشترك في الباقة واستمتع بخصم 20%\nالسعر بعد الخصم: 200 ج.م بدلًا من 250 ج.م\nالعرض متاح حتى: 10 يونيو 2025",
                            buttonColor: Colors.black,
                            backgraundcolor: Colors.amber,
                            textcolor: Colors.black,
                          ),
                          _buildOfferCard(
                            "خصم 15% لطلاب الجامعات!",
                            "ببطاقتك الجامعية سافر بسعر أقل!\nاحصل على خصم 15% عند الدفع من محفظتك الإلكترونية\nالعرض ساري حتى: 30 إبريل 2025",
                            buttonColor: Colors.black,
                            backgraundcolor: Colors.amber,
                            textcolor: Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar1(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildOfferCard(
    String title,
    String description, {
    Color buttonColor = Colors.amber,
    Color backgraundcolor = Colors.black87,
    Color textcolor = Colors.amber,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgraundcolor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 9, color: Colors.white),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              "استفد بالعرض الآن",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
