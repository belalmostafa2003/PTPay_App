import 'package:flutter/material.dart';
import 'package:ptpayapp/core/widget/WalletBalanceCard.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class WalletTopUpPage extends StatelessWidget {
  const WalletTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // للغة العربية
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppBar مخصص
                Directionality(
                    textDirection: TextDirection.ltr,
                    child: const CustomAppBar(title: 'شحن المحفظة')),
                const SizedBox(height: 20),

                // كارت رصيد المحفظة
                const WalletBalanceCard(),

                const Text(
                  'طريقة الشحن:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,fontFamily: 'Alexandria'),
                ),
                const SizedBox(height: 20),

                // عنوان طريقة الشحن "بطاقة بنكية"
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4B300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'بطاقة بنكية',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,fontFamily: 'Alexandria'),
                  ),
                ),
                const SizedBox(height: 20),

                Row(

                  children: [
                    Expanded(flex: 3, child: _buildLabeledField('رقم الكارت',"1111 2222 3333 4444")),
                    const SizedBox(width: 35),
                    Expanded(flex: 1, child: _buildLabeledField('CVC',"656")),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(child: _buildLabeledField('اسم حامل البطاقة',"OMAR ALI MOHAMED")),
                    const SizedBox(width: 123),
                  ],
                ),
                const SizedBox(height: 15),

                const Text('تاريخ انتهاء الصلاحية',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,fontFamily: 'Alexandria'),),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdownField(
                        [
                          '20',
                          '21',
                          '22',
                          '23',
                          '24',
                          '25',
                          '26',
                          '27',
                          '28',
                          '29',
                          '30',
                          '31'
                        ],
                        'Day',
                      ),
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: _buildDropdownField(
                        [
                          'Jan',
                          'Feb',
                          'Mar',
                          'Apr',
                          'May',
                          'Jun',
                          'Jul',
                          'Aug',
                          'Sep',
                          'Oct',
                          'Nov',
                          'Dec'
                        ],
                        'month',
                      ),
                    ),
                    const SizedBox(width: 35),
                    Expanded(
                      child: _buildDropdownField(
                        ['2024', '2025', '2026', '2027', '2028'],
                        'year',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(flex: 3, child: _buildLabeledField('ادخل المبلغ',"200")),
                    const SizedBox(width: 123),
                  ],
                ),
                const SizedBox(height: 25),

                // زر شحن البطاقة
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Center(child: Text("شحن",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400, fontSize: 18,fontFamily: 'Alexandria'),)),
                    )
                ),
                const SizedBox(height: 25),

                // خط فاصل
                const Divider(thickness: 1),
                const SizedBox(height: 25),

                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4B300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'محافظ إلكترونية',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15,fontFamily: 'Alexandria'),
                  ),
                ),
                const SizedBox(height: 20),

                // أيقونات المحافظ الإلكترونية
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildWalletLogo('assets/icon/orange.png'),
                    _buildWalletLogo('assets/icon/etisalat.png'),
                    _buildWalletLogo('assets/icon/cash.png'),
                    _buildWalletLogo('assets/icon/wecash.png'),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildLabeledField('رقم الهاتف',"01063227758"),
                    ),
                    const SizedBox(width: 123),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildLabeledField('الرقم السري الخاص بمحفظتك',"1234567890"),
                    ),
                    const SizedBox(width: 123),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: _buildLabeledField('ادخل المبلغ',"300"),
                    ),
                    const SizedBox(width: 123),
                  ],
                ),
                const SizedBox(height: 25),

                // زر شحن المحفظة
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Center(child: Text("شحن",style: TextStyle(color:Colors.white,fontWeight: FontWeight.w400, fontSize: 18,fontFamily: 'Alexandria'),)),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildLabeledField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            fontFamily: 'Alexandria',
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: hint, // ← هنا يظهر النص المساعد
            hintStyle: TextStyle(color: Colors.grey[600]),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // بناء قائمة منسدلة
  static Widget _buildDropdownField(List<String> items, String hint) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item, textAlign: TextAlign.center),
              ))
          .toList(),
      onChanged: (value) {},
    );
  }

  static Widget _buildWalletLogo(String assetPath) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Image.asset(assetPath, fit: BoxFit.contain),
    );
  }
}
