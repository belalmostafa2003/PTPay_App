import 'package:flutter/material.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';


void main() => runApp(
  const PTPayApp(),
);
class PTPayApp extends StatelessWidget {
  const PTPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      //home: PaymentSuccessPage(tripNumber: 1, amount: 9, dateTime: '', balance: 7, ),
    );
  }
}