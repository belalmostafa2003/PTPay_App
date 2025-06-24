// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRScannerPage extends StatefulWidget {
//   @override
//   _QRScannerPageState createState() => _QRScannerPageState();
// }
//
// class _QRScannerPageState extends State<QRScannerPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex: 5,
//             child: QRView(
//               key: qrKey,
//               onQRViewCreated: (QRViewController controller) {
//                 this.controller = controller;
//                 controller.scannedDataStream.listen((scanData) {
//                   Navigator.pop(context, scanData.code);
//                 });
//               },
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Center(
//               child: ElevatedButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text("إغلاق"),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
