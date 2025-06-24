import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';
import 'package:ptpayapp/core/widget/notification_box.dart';


class DriverNotificationsScreen extends StatelessWidget {
  const DriverNotificationsScreen({super.key});

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xFFF5A800),
        ),
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
            const CustomAppBar(title: 'إشعاراتي'), // خارج Directionality
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle('إشعارات الدفع'),
                      notificationBox([
                        '✅ تم الدفع بنجاح للراكب أحمد سالم - 15 ج.م',
                      ], isRead: false), // ← إشعار تم قراءته

                      notificationBox([
                        '❌ فشل الدفع للراكب مجدي عمرو',
                        'جرّب وسيلة دفع أخرى',
                      ], isRead: true), // ← إشعار غير مقروء (رمادي فاتح)
                      notificationBox([
                        '💰 إجمالي المبلغ المحصل في الرحلة 20587',
                        '225 ج.م',
                      ], isRead: false),
                      sectionTitle('إشعارات الرحلات'),
                      notificationBox([
                        'رحلة جديدة مضافة',
                        'القاهرة → الإسكندرية (اليوم الساعة 9:00 صباحًا)',
                      ], isRead: false),
                      notificationBox([
                        'تذكير:',
                        'موعد مغادرة الرحلة 20587 بعد 30 دقيقة',
                      ], isRead: true),
                      notificationBox([
                        'تم إنهاء الرحلة 20586 بنجاح',
                        'تم تحصيل 280 ج.م',
                      ], isRead: false),
                      sectionTitle('إشعارات التقييمات'),
                      notificationBox([
                        'راكب قام بتقييمك بـ 5 نجوم',
                        '"رحلة رائعة وخدمة ممتازة!"',
                      ], isRead: false),
                      notificationBox([
                        'ملاحظة من الراكب',
                        '"أتمنى توفير شاحن للهاتف في السيارة."',
                      ], isRead: true),
                      sectionTitle('إشعارات عامة'),
                      notificationBox([
                        '🔔 تحديث جديد للتطبيق',
                        'حمل آخر إصدار للحصول على ميزات جديدة',
                      ], isRead: false),
                      notificationBox([
                        '🏆 مبروك!',
                        'حصلت على مكافأة 50 ج.م للسائقين الأكثر نشاطًا',
                      ], isRead: true),
                      notificationBox([
                        '📢 تنبيه من الشركة',
                        'تم تعديل تسعيرة الرحلات بداية من الشهر القادم.',
                      ], isRead: false),
                    ],
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
