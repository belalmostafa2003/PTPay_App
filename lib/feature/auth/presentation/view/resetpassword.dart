import 'package:flutter/material.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/resetpassword_widget/buildSaveButton.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/resetpassword_widget/buildValidationRow.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/resetpassword_widget/buildpasswordField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isPasswordValid = false;
  bool _hasUpperCase = false;
  bool _hasSpecialChar = false;
  bool _isMatch = false;

  void _validatePassword(String password) {
    setState(() {
      _isPasswordValid = password.length >= 8;
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasSpecialChar = password.contains(RegExp(r'[!@#\\\$%^&*(),.?":{}|<>]'));
      _isMatch = password == _confirmPasswordController.text;
    });
  }

  void _validateConfirmPassword(String confirmPassword) {
    setState(() {
      _isMatch = confirmPassword == _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFormValid = _isPasswordValid && _hasUpperCase && _hasSpecialChar && _isMatch;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Center(
                          child: Container(
                              height: 50,
                              width: 110,
                              child: Logo())),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'إعادة تعيين كلمة المرور',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Alexandria',
                            color: Color(0xff1B1C2B)
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          'اختر كلمة مرور جديدة لحسابك تأكد أنها تكون قوية وآمنة',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w400,
                            color: Color(0xff979797),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      PasswordField(
                        label: 'كلمة المرور الجديدة',
                        controller: _passwordController,
                        isVisible: _isPasswordVisible,
                        onChanged: _validatePassword,
                        toggleVisibility: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      ValidationRow(
                        text: 'يجب أن لا تقل كلمة المرور عن 8 أحرف',
                        isValid: _isPasswordValid,
                      ),
                      ValidationRow(
                        text: 'يجب أن تحتوي كلمة المرور على رموز (#, @, \$)',
                        isValid: _hasSpecialChar,
                      ),
                      ValidationRow(
                        text: 'يجب أن تحتوي كلمة المرور على حروف كبيرة (A-Z)',
                        isValid: _hasUpperCase,
                      ),
                      const SizedBox(height: 15),
                      PasswordField(
                        label: 'تأكيد كلمة المرور الجديدة',
                        controller: _confirmPasswordController,
                        isVisible: _isConfirmPasswordVisible,
                        onChanged: _validateConfirmPassword,
                        toggleVisibility: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                      ValidationRow(
                        text: 'متطابقتان',
                        isValid: _isMatch,
                      ),
                      const Spacer(),
                      SaveButton(isFormValid: isFormValid),
                      const SizedBox(height: 140),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
