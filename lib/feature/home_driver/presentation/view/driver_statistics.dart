import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class DriverStatisticsScreen extends StatelessWidget {
  const DriverStatisticsScreen({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 7),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget sectionBox(List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(title: 'إحصائياتي'),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle('قسم الرحلات'),
                        sectionBox([
                          const Text('🔷 إجمالي الرحلات: 120'),
                          const Text('🔷 رحلات اليوم: 5'),
                          const Text('🔷 رحلات هذا الشهر: 30'),
                        ]),
                        sectionTitle('قسم الدفع'),
                        sectionBox([
                          const Text('✅المدفوع: 80 راكب'),
                          const Text('❌ المتبقي: 10 ركاب'),
                          const Text('👥 الإجمالي: 90 راكب'),
                        ]),
                        sectionTitle('قسم الدخل'),
                        sectionBox([
                          const Text('🔷 المحصل اليوم: 500 ج.م'),
                          const Text('🔷 المحصل إلكترونيًا: 300 ج.م'),
                          const Text('🔷 المحصل نقديًا: 200 ج.م'),
                        ]),
                        sectionTitle('قسم التقييمات'),
                        sectionBox([
                          const Text('⭐ متوسط التقييم: 4.8/5'),
                          const Text('💬 آخر التقييمات:'),
                          const Text('- سائق محترم جدًا!'),
                          const Text('- الرحلة كانت سريعة ومريحة'),
                          const Text('- أتمنى إضافة شاحن في السيارة'),
                        ]),
                        sectionTitle('قسم وقت القيادة'),
                        sectionBox([
                          const Text('🔷 القيادة اليوم: 6 ساعات'),
                          const Text('🔷 القيادة هذا الأسبوع: 35 ساعة'),
                          const Text('🔷 أوقات الذروة: 8-10 صباحًا، 6-8 مساءً'),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
