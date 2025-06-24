import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/api_service.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:ptpayapp/core/widget/logo.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/Driver_signup_widgets/CheckboxWidegt.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/Driver_signup_widgets/SaveButtonSignUp.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/Driver_signup_widgets/ValidationRowSignup.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/Driver_signup_widgets/buildPasswordField.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/Driver_signup_widgets/buildTextField.dart';
import 'package:ptpayapp/feature/auth/presentation/view/widget/Driver_signup_widgets/image_picker.dart';

class SignUpPageDriver extends StatefulWidget {
  const SignUpPageDriver({super.key});

  @override
  State<SignUpPageDriver> createState() => _SignUpPageDriverState();
}

class _SignUpPageDriverState extends State<SignUpPageDriver> {
  final _formKey = GlobalKey<FormState>();

  Future<List<Map<String, dynamic>>> fetchGovernorates() async {
    final response = await Dio().get('https://ahmed80800.pythonanywhere.com/api/governorates/');
    return List<Map<String, dynamic>>.from(response.data);
  }

  Future<List<Map<String, dynamic>>> fetchCities(String governorateId) async {
    if (governorateId.isEmpty) return [];
    final response = await Dio().get('https://ahmed80800.pythonanywhere.com/api/cities/', queryParameters: {
      'governorate': governorateId,
    });
    return List<Map<String, dynamic>>.from(response.data);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _governorateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _licenseNumberController = TextEditingController();
  final TextEditingController _personalImageController = TextEditingController();
  final TextEditingController _licenseImageController = TextEditingController();

  bool isFormValid = false;
  bool _isChecked = false;

  bool _isPasswordLengthValid = false;
  bool _hasUpperCase = false;
  bool _hasSpecialChar = false;
  bool _isMatch = false;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  void _validateForm() {
    setState(() {
      isFormValid = _nameController.text.isNotEmpty &&
          _idController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _licenseNumberController.text.isNotEmpty &&
          _isPasswordLengthValid &&
          _hasUpperCase &&
          _hasSpecialChar &&
          _isMatch &&
          _isChecked;
    });
  }

  void _validatePassword(String password) {
    bool isLengthValid = password.length >= 8;
    bool hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    bool hasSpecialChar = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    bool isMatch = password == _confirmPasswordController.text;

    setState(() {
      _isPasswordLengthValid = isLengthValid;
      _hasUpperCase = hasUpperCase;
      _hasSpecialChar = hasSpecialChar;
      _isMatch = isMatch;
    });
    _validateForm();
  }

  void _validateConfirmPassword(String confirmPassword) {
    bool isMatch = confirmPassword == _passwordController.text;
    setState(() {
      _isMatch = isMatch;
    });
    _validateForm();
  }

  final ApiService _apiService = ApiService(Dio());

  Future<void> _registerUser() async {
    if (!isFormValid) return;

    try {
      final formData = FormData.fromMap({
        "name": _nameController.text,
        "national_id": _idController.text,
        "governorate": _governorateController.text,
        "city": _cityController.text,
        "phone": _phoneController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "license_number": _licenseNumberController.text,
        'driver_photo': await MultipartFile.fromFile(
            _personalImageController.text,
            filename: 'photo.jpg'),
        'license_photo': await MultipartFile.fromFile(
            _licenseImageController.text,
            filename: 'license.jpg'),
      });

      final response = await _apiService.postFormData(
        endpoint: 'register/driver/',
        data: formData,
      );

      if (response != null && !response.containsKey('error')) {
        GoRouter.of(context).push(AppRouter.KConfirmAccountCreation);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content:
              Text(response?['error'] ?? "حدث خطأ غير متوقع")),
        );
      }
    } catch (e) {
      print("Error during registration: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("هناك خطأ في البيانات المدخله")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          GoRouter.of(context).push(AppRouter.KChooseLocationSecond);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("عودة",
                              style: TextStyle(fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Alexandria',
                              ),),
                            SizedBox(width: 3,),
                            Icon(Icons.arrow_forward_ios_outlined, color: Colors.black,size: 16,),

                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                            height: 50,
                            width: 110,
                            child: const Logo()),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          "إنشاء حساب سائق",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: 'Alexandria',
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        " 1- البيانات الأساسية",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      buildTextFieldDriver(
                        label: "الإسم الكامل",
                        hint: "الاسم بالكامل",
                        controller: _nameController,
                        onChanged: (_) => _validateForm(),
                      ),
                      buildTextFieldDriver(
                        label: "الرقم القومي أو رقم جواز السفر",
                        hint: "12345678901234",
                        controller: _idController,
                        keyboardType: TextInputType.number,
                        onChanged: (_) => _validateForm(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: FutureBuilder<List<Map<String, dynamic>>>(
                              future: fetchGovernorates(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) return CircularProgressIndicator();
                                final items = snapshot.data!;
                                return DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'المحافظة',
                                    labelStyle: TextStyle(
                                      color: Colors.black,       // اللون
                                      fontSize: 16,              // الحجم
                                      fontFamily: 'Alexandria',       // الخط (مثلاً Cairo لو ضايفه في المشروع)
                                      fontWeight: FontWeight.w400, // لو عايز تخليها بولد
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  value: _governorateController.text.isEmpty ? null : _governorateController.text,
                                  items: items.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item['id'].toString(),
                                      child: Text(item['name']),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _governorateController.text = value!;
                                      _cityController.clear();
                                    });
                                    _validateForm();
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: FutureBuilder<List<Map<String, dynamic>>>(
                              future: fetchCities(_governorateController.text),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) return CircularProgressIndicator();
                                final items = snapshot.data!;
                                return DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    labelText: 'المدينة',
                                    labelStyle: TextStyle(
                                      color: Colors.black,       // اللون
                                      fontSize: 16,              // الحجم
                                      fontFamily: 'Alexandria',       // الخط (مثلاً Cairo لو ضايفه في المشروع)
                                      fontWeight: FontWeight.w400, // لو عايز تخليها بولد
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                  value: _cityController.text.isEmpty ? null : _cityController.text,
                                  items: items.map((item) {
                                    return DropdownMenuItem<String>(
                                      value: item['id'].toString(),
                                      child: Text(item['name']),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _cityController.text = value!;
                                    });
                                    _validateForm();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 9,),
                      buildTextFieldDriver(
                        label: "رقم الهاتف",
                        hint: "+20 رقم الهاتف",
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (_) => _validateForm(),
                      ),
                      buildTextFieldDriver(
                        label: "البريد الإلكتروني",
                        hint: "someone@example.com",
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (_) => _validateForm(),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "الصورة الشخصية",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      ImagePickerWidget(
                        onImageSelected: (File? image) {
                          setState(() {
                            _personalImageController.text =
                                image?.path ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 15),
                      Column(
                        children: [
                          PasswordFieldSignupDriver(
                            label: 'كلمة المرور',
                            controller: _passwordController,
                            isVisible: _isPasswordVisible,
                            onChanged: _validatePassword,
                            toggleVisibility: () => setState(
                                    () => _isPasswordVisible =
                                !_isPasswordVisible),
                          ),
                          ValidationRowSignupDriver(
                            text: 'يجب أن لا تقل كلمة المرور عن 8 أحرف',
                            isValid: _isPasswordLengthValid,
                          ),
                          ValidationRowSignupDriver(
                            text:
                            'يجب أن تحتوي كلمة المرور على رموز مثل (!,@,#,\\\$,)',
                            isValid: _hasSpecialChar,
                          ),
                          ValidationRowSignupDriver(
                            text:
                            'يجب أن تحتوي كلمة المرور على حروف كبيرة (A-Z)',
                            isValid: _hasUpperCase,
                          ),
                          const SizedBox(height: 15),
                          PasswordFieldSignupDriver(
                            label: 'تأكيد كلمة المرور',
                            controller: _confirmPasswordController,
                            isVisible: _isConfirmPasswordVisible,
                            onChanged: _validateConfirmPassword,
                            toggleVisibility: () => setState(
                                    () => _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible),
                          ),
                          ValidationRowSignupDriver(
                            text: 'متطابقتان',
                            isValid: _isMatch,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        " 2- بيانات المركبة والرخصة",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      buildTextFieldDriver(
                        label: "رقم الرخصة (الموجود في الخلفية)",
                        hint: "D/1234567",
                        controller: _licenseNumberController,
                        onChanged: (_) => _validateForm(),
                      ),
                      const Text(
                        "صورة الرخصة",
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 8),
                      ImagePickerWidget(
                        onImageSelected: (File? image) {
                          setState(() {
                            _licenseImageController.text =
                                image?.path ?? '';
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CheckboxWidgetDriver(
                        onChanged: (acceptUpdates, acceptTerms) {
                          setState(() {
                            _isChecked = acceptTerms;
                          });
                          _validateForm();
                        },
                      ),
                      const SizedBox(height: 20),
                      SaveButtonSignUpDriver(
                        isFormValid: isFormValid,
                        onPressed: _registerUser,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "لديك حساب ؟ ",
                            style: TextStyle(
                                fontSize: 17, color: Color(0xff979797)),
                          ),
                          InkWell(
                            onTap: () => GoRouter.of(context)
                                .push(AppRouter.KChooseLocationFirst),
                            child: const Text(
                              " تسجيل الدخول  ",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}