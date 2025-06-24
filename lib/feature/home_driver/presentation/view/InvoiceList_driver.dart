import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/widget/bottomvavigatorbar.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';


class InvoicelistDriver extends StatefulWidget {
  @override
  _InvoicelistDriverState createState() => _InvoicelistDriverState();
}

class _InvoicelistDriverState extends State<InvoicelistDriver> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

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

  final List<Map<String, String>> invoices = [
    {
      "tripNumber": " H56 / 2",
      "date": "18 فبراير 2025 - 12:45 ص",
      "route": "لسنبلاوين ⬅ المنصورة",
      "price": "250 ج.م",
      "vehicle": "14",
    },
    {
      "tripNumber": "D100",
      "date": "18 فبراير 2025 - 12:45 ص",
      "route": "لسنبلاوين ⬅ المنصورة",
      "price": "250 ج.م",
      "vehicle": "14",
    },
    {
      "tripNumber": "D100",
      "date": "18 فبراير 2025 - 12:45 ص",
      "route": "لسنبلاوين ⬅ المنصورة",
      "price": "250 ج.م",
      "vehicle": "14",
    },
    {
      "tripNumber": "D100",
      "date": "18 فبراير 2025 - 12:45 ص",
      "route": "لسنبلاوين ⬅ المنصورة",
      "price": "250 ج.م",
      "vehicle": "14",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CustomAppBar(title: 'رحلاتي السابقة'),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  suffixIcon: const Icon(Icons.search, color: Colors.black54),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  "قائمة الفواتير",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (context, index) {
                  return InvoiceCard(invoice: invoices[index]);
                },
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
}

class InvoiceCard extends StatelessWidget {
  final Map<String, String> invoice;
  const InvoiceCard({required this.invoice});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                " ${invoice["tripNumber"]} :رقم الرحلة",
                style: const TextStyle(
                  color: Color(0xffF4B300),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(" التاريخ: ${invoice["date"]}",
                      textAlign: TextAlign.right),
                  Text("المسار: ${invoice["route"]}",
                      textAlign: TextAlign.right),
                  Text("إجمالي الإيراد:: ${invoice["price"]}",
                      textAlign: TextAlign.right),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF4B300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push( context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         InvoiceDetailsPage(invoice: invoice),
                          //   ),
                          // );
                        },
                        child: const Text(
                          "عرض التفاصيل",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const Spacer(),
                      Text("عدد الركاب: ${invoice["vehicle"]}",
                          textAlign: TextAlign.right),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
