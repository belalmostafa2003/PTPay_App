import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class InvoiceDetailsPage extends StatelessWidget {
  final Map<String, String> invoice;

  InvoiceDetailsPage({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(title: 'تفاصيل الرحلة'),
                  const SizedBox(height: 10),
                  sectionTitle("معلومات الرحلة"),
                  infoCard([
                    "رقم الرحلة: ${invoice["tripNumber"]}",
                    "موعد الرحلة: ${invoice["date"]}",
                    "مدة الرحلة: 25 دقيقة",
                    "المسار: ${invoice["route"]}",
                    "محطة الصعود: محطة السنبلاوين",
                    "محطة النزول: محطة المنصورة",
                  ]),
                  sectionTitle("معلومات المركبة"),
                  infoCard([
                    "رقم المركبة: ${invoice["vehicle"]}",
                    "نوع المركبة: ميني باص",
                    "اسم السائق: مازن علي",
                  ]),
                  sectionTitle("تفاصيل الدفع"),
                  infoCard([
                    "سعر الرحلة: ${invoice["price"]}",
                    "طريقة الدفع: ${invoice["paymentMethod"]}",
                    "وقت الدفع: 11:35 صباحًا",
                  ]),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            vertical: 23, horizontal: 130),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "طباعة الفاتورة",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.right,
        ),
      ),
    );
  }

  Widget infoCard(List<String> details) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            color: Colors.black, width: 1.2, style: BorderStyle.solid),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: details
            .map((detail) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    detail,
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.right,
                  ),
                ))
            .toList(),
      ),
    );
  }
}
