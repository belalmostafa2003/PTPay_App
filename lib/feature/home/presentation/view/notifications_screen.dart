import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';
import 'package:ptpayapp/core/widget/notification_box.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                const CustomAppBar(title: 'الإشعارات'),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      notificationBox(
                          ["تم شحن محفظتك بمبلغ 1100 جنيه بنجاح! ✅"],
                          isRead: false),
                      notificationBox([
                        "تم خصم 10 جنيه من محفظتك مقابل رحلتك من \"السنبلاوين\" إلى \"المنصورة\" 🔄"
                      ], isRead: true),
                      notificationBox([
                        "✉️ تم استلام 50 جنيه في محفظتك من \"عمر علي\"",
                      ], isRead: false),
                      notificationBox([
                        "⚠️ رصيد محفظتك منخفض (5 جنيه فقط)، اشحن الآن لتجنب توقف الخدمة."
                      ], isRead: false),
                      notificationBox([
                        "🎁 باقة جديدة متاحة: 50 رحلة بسعر أقل! سافر أكثر وادفع أقل."
                      ], isRead: false),
                      notificationBox([
                        "🔥 خصم 20% على أول 5 رحلات باستخدام PTPay! استغل العرض الآن."
                      ], isRead: false),
                      notificationBox([
                        "🔒 تم تسجيل الدخول إلى حسابك من جهاز جديد. إذا لم تكن أنت، قم بتغيير كلمة المرور فورًا."
                      ], isRead: false),
                      notificationBox([
                        "📢 تذكير: لا تشارك بيانات حسابك أو رمز OTP مع أي شخص"
                      ], isRead: false),
                      notificationBox([
                        "🛡️ تحديث جديد لنظام الأمان لحماية معاملاتك بشكل أقوى"
                      ], isRead: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNotificationItem(String text, {bool highlighted = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: highlighted ? Colors.grey[200] : Colors.white,
        border: Border.all(color: Colors.orange),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
