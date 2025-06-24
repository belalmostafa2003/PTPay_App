// lib/feature/home/presentation/view/PaymentDetailsPage.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:dotted_border/dotted_border.dart';

class PaymentDetailsPage extends StatefulWidget {
  final double amount;
  final double fee;
  final double total;
  final int    tripNumber;
  final String token;

  const PaymentDetailsPage({
    Key? key,
    required this.amount,
    required this.fee,
    required this.total,
    required this.tripNumber,
    required this.token,
  }) : super(key: key);

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  double _currentBalance = 0.0;
  bool   _isSubmitting   = false;

  @override
  void initState() {
    super.initState();
    _loadCurrentBalance();
  }

  Future<void> _loadCurrentBalance() async {
    final prefs = await SharedPreferences.getInstance();
    final uid   = prefs.getString('uid') ?? '';
    if (uid.isEmpty) return;

    try {
      final res = await http.get(
        Uri.parse('https://ahmed80800.pythonanywhere.com/api/customers/$uid/'),
        headers: {'Content-Type':'application/json'},
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String,dynamic>;
        if (mounted) {
          setState(() => _currentBalance = (data['balance'] as num).toDouble());
        }
      }
    } catch (_) {/* تجاهُل الخطأ */}
  }

  void _onConfirmPressed() {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);
    _submit();
  }

  Future<void> _submit() async {
    final prefs = await SharedPreferences.getInstance();
    final uid   = prefs.getString('uid') ?? '';

    try {
      final res = await http.post(
        Uri.parse('https://ahmed80800.pythonanywhere.com/api/payments/process/'),
        headers: {'Content-Type':'application/json'},
        body: jsonEncode({
          'uid'           : uid,
          'trip_id'       : widget.tripNumber,
          'fare'          : widget.total,
          'payment_method': 'qr',
        }),
      );

      if (!mounted) return;

      if (res.statusCode == 201) {
        final data    = jsonDecode(res.body) as Map<String,dynamic>;
        final tripId  = data['trip_id']  as int;
        final amount  = (data['fare']    as num).toDouble();
        final balance = (data['new_balance'] as num?)?.toDouble()??0.0;
        final date    = data['timestamp'] as String;

        context.go(
          AppRouter.KPaymentSuccessPage,
          extra: {
            'tripNumber': tripId,
            'amount'    : amount,
            'balance'   : balance,
            'dateTime'  : date,
          },
        );
      } else {
        _showError(res);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showError(http.Response res) {
    String msg;
    try {
      msg = jsonDecode(res.body)['error'] ?? res.body;
    } catch (_) {
      msg = 'خطأ غير معروف (${res.statusCode})';
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AbsorbPointer(
        absorbing: _isSubmitting,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 35),
              InkWell(
                onTap : _isSubmitting ? null : () => GoRouter.of(context).pop(),
                child : Row(
                  children: const [
                    Icon(Icons.arrow_back_ios_new_outlined,
                        color: Colors.black, size: 16),
                    SizedBox(width: 3),
                    Text('عودة',
                      style: TextStyle(
                        fontSize : 16,
                        color    : Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Alexandria',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width : 110,
                height: 50,
                child : Logo(),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text('تفاصيل الدفع',
                    style: TextStyle(
                      color : Colors.black,
                      fontSize: 24,
                      fontFamily: 'Alexandria',
                      fontWeight: FontWeight.w400,
                      height: 1.04,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child       : DottedBorder(
                    color      : Colors.black,
                    dashPattern: [15,12],
                    strokeWidth: 3,
                    borderType : BorderType.RRect,
                    radius     : const Radius.circular(30),
                    child      : Padding(
                      padding : const EdgeInsets.all(16),
                      child   : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('المبلغ المستحق: ${widget.amount.toStringAsFixed(0)} ج.م',
                            style: const TextStyle(
                              fontFamily: 'Alexandria',
                              fontSize : 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('رسوم الخدمة: ${widget.fee.toStringAsFixed(0)} ج.م',
                            style: const TextStyle(
                              fontFamily: 'Alexandria',
                              fontSize : 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('الإجمالي: ${widget.total.toStringAsFixed(0)} ج.م',
                            style: const TextStyle(
                              fontFamily: 'Alexandria',
                              fontSize : 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text('رصيدك الحالي: ${_currentBalance.toStringAsFixed(0)} ج.م',
                            style: const TextStyle(
                              fontFamily: 'Alexandria',
                              fontSize : 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isSubmitting ? null
                          : () => GoRouter.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE40408),
                        padding        : const EdgeInsets.symmetric(vertical: 16),
                        shape          : const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      child: const Text('إلغاء',
                        style: TextStyle(
                          color     : Colors.white,
                          fontSize  : 15,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onConfirmPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff1DA43A),
                        padding        : const EdgeInsets.symmetric(vertical: 16),
                        shape          : const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                      ),
                      child: _isSubmitting
                          ? const SizedBox(
                        width : 20,
                        height: 20,
                        child : CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                          : const Text('تأكيد الدفع',
                        style: TextStyle(
                          color     : Colors.white,
                          fontSize  : 15,
                          fontFamily: 'Alexandria',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}