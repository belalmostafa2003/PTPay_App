import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:go_router/go_router.dart';


class ReportProblemPage extends StatefulWidget {
  const ReportProblemPage({super.key});

  @override
  State<ReportProblemPage> createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
  final List<String> problems = [
    "خطأ في بيانات الرحلة",
    "السعر غير صحيح",
    "السائق تجاوز السرعة",
    "السائق رفض توصيل الراكب",
    "تم الخصم مرتين",
    "تأخر غير مبرر في بداية الرحلة",
    "المركبة غير نظيفة",
    "لم يتم قبول الدفع بالبطاقات",
    "السائق تعامل بشكل غير لائق",
  ];

  final List<String> selectedProblems = [];
  final TextEditingController otherProblemController = TextEditingController();

  void toggleProblem(String problem) {
    setState(() {
      if (selectedProblems.contains(problem)) {
        selectedProblems.remove(problem);
      } else {
        selectedProblems.add(problem);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => GoRouter.of(context).pop(),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'عودة',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Alexandria',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/logo3.png',
                      height: 40,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "الإبلاغ عن مشكلة",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alexandria',
                  ),
                ),
                const SizedBox(height: 16),

                const Text(
                  "نوع المشكلة",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Alexandria',
                  ),
                ),
                const SizedBox(height: 10),

                Wrap(
                  spacing: 8,
                  runSpacing: 10,
                  children: problems.map((problem) {
                    final isSelected = selectedProblems.contains(problem);
                    return GestureDetector(
                      onTap: () => toggleProblem(problem),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xffF4B300) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            )
                          ],
                        ),
                        child: Text(
                          problem,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 13,
                            fontFamily: 'Alexandria',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4, bottom: 6),
                      child: Text(
                        "مشكلة أخرى",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Alexandria',
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DottedBorder(
                      color: Colors.black,
                      strokeWidth: 1.5,
                      dashPattern: [6, 4],
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      child: Container(
                        height: 170,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.topRight,
                        child: TextField(
                          controller: otherProblemController,
                          maxLines: null,
                          textAlign: TextAlign.right, // ← مهم لمحاذاة النص لليمين
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'أدخل تفاصيل المشكلة...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        print("تم الإبلاغ عن: $selectedProblems");
                        print("مشكلة أخرى: ${otherProblemController.text}");
                      },
                      child: const Text(
                        'إرسال',
                        style: TextStyle(
                          fontFamily: 'Alexandria',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
