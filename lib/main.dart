import 'package:flutter/material.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const PTPayApp(),
    ),
  );
}

class PTPayApp extends StatelessWidget {
  const PTPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      useInheritedMediaQuery: true, 
      locale: DevicePreview.locale(context), 
      builder: DevicePreview.appBuilder, 
    );
  }
}
