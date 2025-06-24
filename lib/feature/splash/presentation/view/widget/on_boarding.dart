import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ptpayapp/core/utils/gorouter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _imageController = PageController();
  final PageController _textController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "وداعًا للكاش... أهلاً بـ PTPay !",
      "description":
      "ادفع بسهولة باستخدام كارت الـ NFC أو المحفظة الإلكترونية، واستمتع برحلة سلسة بدون تعقيدات الدفع التقليدية.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "شحن المحفظة بسهولة",
      "description":
      "زود رصيدك في أي وقت من خلال البطاقة البنكية، فودافون كاش، أو فوري علشان متتعطلش أبدًا.",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "جاهز تنطلق؟",
      "description": "ابدأ دلوقتي وسجل حسابك، وخلي الدفع أذكى وأسهل مع PTPay!",
    }
  ];

  void _nextPage() {
    if (_currentPage < pages.length - 1) {
      _imageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      _textController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).push(AppRouter.KStartLoginPage);
    }
  }

  @override
  void dispose() {
    _imageController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // صورة الخلفية المتغيرة
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 530,
              child: PageView.builder(
                controller: _imageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(
                    pages[index]["image"]!,
                    width: double.infinity,
                    height: 450,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),

            // زر تخطي في الأعلى
            // زر تخطي في الأعلى
            // زر تخطي في الأعلى اليمين بحواف مستطيلة
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.KStartLoginPage);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black54, width: 1), // Border أسود خفيف
                    borderRadius: BorderRadius.circular(4), // حواف مستطيلة
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'تخطي',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF4B300), // لون النص أصفر
                          fontFamily: 'Alexandria',
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 17,
                        color: Color(0xffF4B300), // لون السهم أصفر
                      ),
                    ],
                  ),
                ),
              ),
            ),


            // الصندوق الأسود السفلي
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 466,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff0B0D14),
                      Color(0xff121520),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _textController,
                        itemCount: pages.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  pages[index]["title"]!,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontFamily: 'Alexandria',
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  pages[index]["description"]!,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Alexandria',
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // مؤشر الصفحات
                          SmoothPageIndicator(
                            controller: _textController,
                            count: pages.length,
                            effect: ExpandingDotsEffect(
                              activeDotColor: Color(0xFFFF6A00),
                              dotColor: Colors.white54,
                              dotHeight: 8,
                              dotWidth: 8,
                            ),
                          ),
                          // زر التالي
                          GestureDetector(
                            onTap: _nextPage,
                            child: Container(
                              width: 70,
                              height: 70,
                              child: Image.asset("assets/icon/skip.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
