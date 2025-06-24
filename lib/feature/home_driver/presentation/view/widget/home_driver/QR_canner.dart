import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanPageDriver extends StatefulWidget {
  @override
  _QRScanPageDriverState createState() => _QRScanPageDriverState();
}

class _QRScanPageDriverState extends State<QRScanPageDriver> {
  final MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            // شريط عودة
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'عودة',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            // ماسح الـ QR
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  MobileScanner(
                    controller: controller,
                    onDetect: (capture) {
                      // capture.barcodes هو List<Barcode>
                      if (capture.barcodes.isNotEmpty) {
                        final code = capture.barcodes.first.rawValue;
                        if (code != null) {
                          Navigator.pop(context, code);
                        }
                      }
                    },
                  ),
                  // خط المسح
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2 - 1,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}