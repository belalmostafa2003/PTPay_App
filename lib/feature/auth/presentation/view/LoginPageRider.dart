import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/login_widgets/TextformWidget.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/login_widgets/LoginButtonWidget.dart';

class LoginPageRider extends StatefulWidget {
  const LoginPageRider({super.key});

  @override
  State<LoginPageRider> createState() => _LoginPageRiderState();
}

class _LoginPageRiderState extends State<LoginPageRider> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isDataEntered = false;
  String? _error;

  void _checkDataEntered(String phone, String password) {
    setState(() {
      _isDataEntered = phone.isNotEmpty && password.isNotEmpty;
    });
  }

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await http.post(
        Uri.parse("https://ahmed80800.pythonanywhere.com/api/passenger/token/"),
        body: {
          'phone': _phoneController.text.trim(),
          'password': _passwordController.text.trim(),
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['access'] != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', data['access']);
        await prefs.setString('phone', _phoneController.text.trim());
        if (data['refresh'] != null) await prefs.setString('refresh_token', data['refresh']);
        if (data['uid'] != null) await prefs.setString('uid', data['uid']);

        if (mounted) {
          GoRouter.of(context).push(AppRouter.KHomepage);
        }
      } else {
        setState(() {
          _error = data['detail'] ?? "فشل تسجيل الدخول. تأكد من البيانات.";
        });
      }
    } catch (e) {
      setState(() {
        _error = "حدث خطأ: $e";
      });
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.KChooseLocationFirst);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,size: 16,),
                        SizedBox(width: 3,),
                        Text("عودة",
                          style: TextStyle(fontSize: 16,
                          color: Colors.black,
                              fontWeight: FontWeight.w400,
                            fontFamily: 'Alexandria',
                          ),),
                      ],
                    ),
                  ),
                  Container(
                      height: 50,
                      width: 110,
                      child: const Logo()),
                  const SizedBox(height: 60),
                  Center(
                    child: Text(
                      'تسجيل الدخول الراكب',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Alexandria',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  TextformWidget(
                    phoneController: _phoneController,
                    passwordController: _passwordController,
                    onDataEntered: _checkDataEntered,
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _error!,
                      style: const TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ],
                  const SizedBox(height: 9),
                  InkWell(
                    onTap: () => GoRouter.of(context).push(AppRouter.KEnterPhone),
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'نسيت كلمة المرور؟',
                          style: TextStyle(
                            color: Color(0xFFF4B300),
                            fontSize: 12,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : LoginButtonWidget(
                    isDataEntered: _isDataEntered,
                    onTap: _handleLogin,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => GoRouter.of(context).push(AppRouter.KChooseLocationSecond),
                        child: const Text(
                          "إنشاء حساب ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xFFF4B300),
                            fontFamily: 'Alexandria',
                          ),
                        ),
                      ),
                      const Text(
                        "ليس لديك حساب ؟ ",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xffACACAC),
                          fontFamily: 'Alexandria',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
