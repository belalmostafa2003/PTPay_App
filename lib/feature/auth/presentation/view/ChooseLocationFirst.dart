import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/ChooseLocationFirst_widget/optioncard.dart';

class ChooseLocationFirst extends StatefulWidget {
  const ChooseLocationFirst({super.key});

  @override
  State<ChooseLocationFirst> createState() => _ChooseLocationFirstState();
}

class _ChooseLocationFirstState extends State<ChooseLocationFirst> {
  String? selectedRole;

  void _handleNext() {
    if (selectedRole == 'سائق') {
      GoRouter.of(context).push(AppRouter.KLoginPageDriver);
    } else if (selectedRole == 'راكب') {
      GoRouter.of(context).push(AppRouter.KLoginPageRider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  SizedBox(height: 50, width: 110, child: const Logo()),
                  const SizedBox(height: 150),
                  const Text(
                    'هل أنت..؟',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Alexandria',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OptionCard(
                        image: 'assets/images/driver.png',
                        label: 'سائق',
                        isSelected: selectedRole == 'سائق',
                        onTap: () {
                          setState(() {
                            selectedRole = 'سائق';
                          });
                        },
                      ),
                      OptionCard(
                        image: 'assets/images/rider.png',
                        label: 'راكب',
                        isSelected: selectedRole == 'راكب',
                        onTap: () {
                          setState(() {
                            selectedRole = 'راكب';
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 80,),
                  InkWell(
                    onTap: selectedRole != null ? _handleNext : null,
                    child: Container(
                      width: 300,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'التالي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.80,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

