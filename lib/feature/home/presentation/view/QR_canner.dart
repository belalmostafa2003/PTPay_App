import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRScanPageRider extends StatefulWidget {
  @override
  _QRScanPageRiderState createState() => _QRScanPageRiderState();
}

class _QRScanPageRiderState extends State<QRScanPageRider>
    with SingleTickerProviderStateMixin {
  final MobileScannerController controller = MobileScannerController();
  late final AnimationController _lineController;
  late final Animation<double> _lineAnimation;

  double _currentZoom = 1.0;
  double _lastScale = 1.0;
  final double _minZoom = 1.0;
  final double _maxZoom = 4.0;

  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _lineController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _lineController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _lineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => GoRouter.of(context).push(AppRouter.KHomepage),
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  Text('عودة', style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final scanHeight = constraints.maxHeight;
                  return GestureDetector(
                    onScaleStart: (_) => _lastScale = 1.0,
                    onScaleUpdate: (details) {
                      final scaleChange = details.scale / _lastScale;
                      _lastScale = details.scale;
                      final newZoom = (_currentZoom * scaleChange)
                          .clamp(_minZoom, _maxZoom);
                      controller.setZoomScale(newZoom);
                      _currentZoom = newZoom;
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        MobileScanner(
                          controller: controller,
                          onDetect: (capture) async {
                            if (_isDetecting) return;
                            _isDetecting = true;
                            controller.stop();

                            final raw = capture.barcodes.first.rawValue;
                            if (raw == null) return;

                            final uri = Uri.parse(raw);
                            final tripId = uri.queryParameters['trip_id'];
                            final token  = uri.queryParameters['token'];
                            if (tripId == null || token == null) return;

                            final prefs = await SharedPreferences.getInstance();
                            final currentBalance = prefs.getDouble('balance') ?? 0.0;

                            GoRouter.of(context).push(
                              AppRouter.KTripDetailsPage,
                              extra: {
                                'tripNumber':    int.parse(tripId),
                                'from':          uri.queryParameters['from'] ?? '',
                                'to':            uri.queryParameters['to'] ?? '',
                                'dateTime':      uri.queryParameters['dateTime'] ?? '',
                                'price':         5.0,
                                'vehicleNumber': uri.queryParameters['vehicleNumber'] ?? '',
                                'balance':       currentBalance,
                                'token':         token,
                              },
                            );
                          },
                        ),
                        AnimatedBuilder(
                          animation: _lineAnimation,
                          builder: (context, child) {
                            final yPos = scanHeight * _lineAnimation.value;
                            return Positioned(
                              top: yPos,
                              left: 0,
                              right: 0,
                              child: Container(height: 2, color: Colors.yellow),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}