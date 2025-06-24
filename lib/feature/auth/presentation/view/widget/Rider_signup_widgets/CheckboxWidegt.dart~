import 'package:flutter/material.dart';

class CheckboxWidget extends StatefulWidget {
  final Function(bool, bool) onChanged; // استقبال التغييرات

  const CheckboxWidget({super.key, required this.onChanged});

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  bool _acceptUpdates = false;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCustomCheckbox(
          title: "أقبل استقبال التحديثات عبر البريد الإلكتروني.",
          value: _acceptTerms,
          onChanged: (value) {
            setState(() {
              _acceptTerms = value!;
            });
            widget.onChanged(_acceptUpdates, _acceptTerms);
          },
        ),
        _buildCustomCheckbox(
          title: "أوافق على سياسة الخصوصية وحقوق الاستخدام.",
          value: _acceptTerms,
          onChanged: (value) {
            setState(() {
              _acceptTerms = value!;
            });
            widget.onChanged(_acceptUpdates, _acceptTerms);
          },
        ),
      ],
    );
  }

  Widget _buildCustomCheckbox({required String title, required bool value, required Function(bool?) onChanged}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(right: 8),
      minLeadingWidth: 0,
      horizontalTitleGap: 8,
      leading: GestureDetector(
        onTap: () {
          onChanged(!value);
        },
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: value ? const Color(0xff4DA66B) : const Color(0xff979797),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: value
              ? const Icon(Icons.check, color: Color(0xff4DA66B), size: 15)
              : null,
        ),
      ),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          fontFamily: 'Alexandria',
          color: Colors.black,
        ),
      ),
    );
  }
}
