import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/MoneyTranser_widget/LoginButtonMoney.dart';
import 'package:ptpayapp/feature/home/presentation/view/widget/MoneyTranser_widget/TextformMoney.dart';

class MoneyTransfer extends StatefulWidget {
  const MoneyTransfer({super.key});

  @override
  State<MoneyTransfer> createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  bool isButtonEnabled = false;
  String? _uid;
  String _senderPhone = '';
  double walletBalance = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_onInputChange);
    amountController.addListener(_onInputChange);
    _loadUidAndBalance();
  }

  @override
  void dispose() {
    _timer?.cancel();
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _onInputChange() {
    setState(() {
      isButtonEnabled =
          phoneController.text.isNotEmpty && amountController.text.isNotEmpty;
    });
  }

  Future<void> _loadUidAndBalance() async {
    final prefs = await SharedPreferences.getInstance();
    _uid = prefs.getString('uid') ?? '';
    _senderPhone = prefs.getString('phone') ?? '';
    if (_uid!.isNotEmpty) {
      await _refreshBalance();
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        _refreshBalance();
      });
    }
  }

  Future<void> _refreshBalance() async {
    final apiUrl =
        'https://ahmed80800.pythonanywhere.com/api/customers/$_uid/';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          walletBalance = (data['balance'] as num).toDouble();
        });
      }
    } catch (e) {
      debugPrint('Error fetching balance: $e');
    }
  }

  Future<Map<String, dynamic>?> _fetchRecipient(String phone) async {
    // Using the legacy endpoint to get all customers then filter by phone
    final url = Uri.parse(
        'https://ahmed80800.pythonanywhere.com/api/customers-list/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final list = jsonDecode(response.body) as List;
        for (var item in list) {
          if (item['phone'] == phone) {
            return item as Map<String, dynamic>;
          }
        }
      }
    } catch (e) {
      debugPrint('Error fetching recipient: $e');
    }
    return null;
  }

  Future<void> _checkAndConfirmTransfer() async {
    final receiver = phoneController.text.trim();
    final amount = double.tryParse(amountController.text) ?? 0.0;

    if (walletBalance < amount) {
      _showAlert('رصيد غير كافي');
      return;
    }

    final recipient = await _fetchRecipient(receiver);
    if (recipient == null) {
      _showAlert('رقم المحفظة غير موجود');
      return;
    }

    final name = recipient['name'] as String? ?? 'غير معروف';
    const fee = 2.0;
    final total = amount + fee;

    _showConfirmationDialog(receiver, name, amount, fee, total);
  }

  Future<void> _performTransfer(
      String receiverPhone, double amount) async {
    final url =
    Uri.parse('https://ahmed80800.pythonanywhere.com/api/transfers/');
    final body = jsonEncode({
      'from_phone': _senderPhone,
      'to_phone': receiverPhone,
      'amount': amount.toString(),
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        setState(() {
          walletBalance -= amount;
        });
        _showAlert('تم التحويل بنجاح');
      } else {
        final error = jsonDecode(response.body);
        _showAlert(error['error'] ?? 'فشل التحويل');
      }
    } catch (e) {
      _showAlert('حدث خطأ أثناء التحويل');
    }
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تنبيه'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('موافق'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(String receiver, String name, double amount,
      double fee, double total) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffFFFFFF),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xffFFB300), width: 2),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'تأكيد عملية التحويل',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'تفاصيل المستلم:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFB300),
                  ),
                ),
                const SizedBox(height: 4),
                Text('الاسم: $name'),
                Text('رقم المحفظة: $receiver'),
                const SizedBox(height: 12),
                const Text(
                  'تفاصيل المبلغ:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFB300),
                  ),
                ),
                const SizedBox(height: 4),
                Text('المبلغ: $amount جنيه'),
                Text('رسوم التحويل: $fee جنيه'),
                Text('المبلغ الإجمالي: $total جنيه'),
                const SizedBox(height: 12),
                const Text(
                  'طريقة الدفع:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFB300),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.green, size: 20),
                    SizedBox(width: 6),
                    Expanded(child: Text('سيتم خصم المبلغ من رصيد محفظتك في التطبيق')),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Icon(Icons.warning, color: Colors.orange, size: 20),
                    SizedBox(width: 6),
                    Expanded(child: Text('تأكد من صحة بيانات المستلم؛ لا يمكن استرجاع الأموال بعد الإرسال.')),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEB001B),
                        minimumSize: const Size(100, 40),
                      ),
                      child: const Text('إلغاء'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _performTransfer(receiver, amount);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4DA66B),
                        minimumSize: const Size(100, 40),
                      ),
                      child: const Text('تأكيد'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () =>
                        GoRouter.of(context).push(AppRouter.KHomepage),
                    child: Row(
                      children: const [
                        Icon(Icons.arrow_back_ios_new),
                        SizedBox(width: 5),
                        Text(
                          'عودة',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 83, height: 36, child: Logo()),
                  const Text(
                    'تحويل الأموال',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 300,
                  height: 90,
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'رصيد المحفظة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              '$walletBalance جنيه',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Image.asset('assets/icon/eye.png',
                              height: 26, width: 32),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextformMoney(
                phoneController: phoneController,
                moneyController: amountController,
                onDataEntered: (_, __) {},
              ),
              const Spacer(),
              Center(
                child: LoginButtonMoney(
                  isDataEntered: isButtonEnabled,
                  onTap: _checkAndConfirmTransfer,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}