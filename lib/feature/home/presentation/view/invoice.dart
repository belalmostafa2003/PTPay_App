import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/invoice_widget/Discountdetails.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/invoice_widget/buttons.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/invoice_widget/detailsoperation.dart';

class Invoice extends StatelessWidget {
  const Invoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.arrow_back_ios_new),
                          const SizedBox(width: 5),
                          const Text(
                            'عودة',
                            style: TextStyle(
                              color: Color(0xFF1B1C2B),
                              fontSize: 14,
                              fontFamily: 'Alexandria',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 83, height: 36, child: Logo()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      height: 125,
                      width: 125,
                      child: Image.asset("assets/icon/true.png"),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      'عميلة ناجحة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  const DetailsOperation(),
                  const SizedBox(height: 25),
                  const DiscountDetails(),
                  const SizedBox(height: 15),
                  const Center(
                    child: Text(
                      'رصيدك الحالي\n320.00 ج.م',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  const Buttons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
