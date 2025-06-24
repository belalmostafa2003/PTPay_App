import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/widget/bottomvavigatorbar.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';
import 'package:ptpayapp/feature/home/presentation/view/Invoice_details.dart';

class InvoiceListScreen extends StatefulWidget {
  @override
  _InvoiceListScreenState createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

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
      "tripNumber": "H100",
      "date": "02/2/2025 11:30 صباحًا",
      "route": "الترعه ➡️ الدرسات",
      "price": "10 ج.م",
      "vehicle": "XZXS36",
      "paymentMethod": "محفظة PTPay",
    },
    {
      "tripNumber": "D109",
      "date": "02/2/2025 11:30 مساءً",
      "route": "الترعه ➡️ الدرسات",
      "price": "75 ج.م",
      "vehicle": "KLMN23",
      "paymentMethod": "كارت NFC",
    },
    {
      "tripNumber": "A120",
      "date": "04/2/2025 8:30 مساءً",
      "route": "القاهرة ➡️ السنبلاوين",
      "price": "75 ج.م",
      "vehicle": "ZTYR99",
      "paymentMethod": "محفظة PTPay",
    },
    {
      "tripNumber": "S201",
      "date": "08/2/2025 8:30 مساءً",
      "route": "السنبلاوين ➡️ الإسكندرية",
      "price": "123 ج.م",
      "vehicle": "SFVC57",
      "paymentMethod": "محفظة PTPay",
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            const CustomAppBar(title: 'رحلاتي السابقة'),
            SizedBox(height: screenHeight * 0.015),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
              child: TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: screenWidth * 0.04,
                  ),
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
                  return InvoiceCard(
                    invoice: invoices[index],
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  );
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
  final double screenWidth;
  final double screenHeight;

  const InvoiceCard({
    required this.invoice,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.black, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                " ${invoice["tripNumber"]} :رقم الرحلة",
                style: TextStyle(
                  color: const Color(0xffF4B300),
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.045,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight * 0.23,
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("موعد الرحلة: ${invoice["date"]}", textAlign: TextAlign.right),
                Text("المسار: ${invoice["route"]}", textAlign: TextAlign.right),
                Text("السعر: ${invoice["price"]}", textAlign: TextAlign.right),
                Text("المركبة: ${invoice["vehicle"]}", textAlign: TextAlign.right),
                const Spacer(),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InvoiceDetailsPage(invoice: invoice),
                          ),
                        );
                      },
                      child: const Text(
                        "عرض التفاصيل",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const Spacer(),
                    Text("طريقة الدفع: ${invoice["paymentMethod"]}",
                        textAlign: TextAlign.right),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
