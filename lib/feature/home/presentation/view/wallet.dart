import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ptpayapp/core/widget/WalletBalanceCard.dart';
import 'package:ptpayapp/core/widget/custom_appBar.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'محفظتي'),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const WalletBalanceCard(),
                    const WalletActions(),
                    const WalletTransactions(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletActions extends StatelessWidget {
  const WalletActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        WalletActionButton(
          label: 'شحن المحفظة',
          icon: Iconsax.wallet_2,
          onTap: () => context.push('/WalletTopUpPage'),
        ),
        WalletActionButton(
          label: 'تحويل الأموال',
          icon: Iconsax.export,
          onTap: () => context.push('/'),
        ),
        WalletActionButton(
          label: 'مشاركة QR',
          icon: Iconsax.scan_barcode,
          onTap: () => context.push('/'),
        ),
      ],
    );
  }
}

class WalletActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const WalletActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(label, style: const TextStyle(fontSize: 15)),
            const SizedBox(width: 12),
            const Spacer(),
            Icon(icon, color: Colors.orange, size: 22),
          ],
        ),
      ),
    );
  }
}

class WalletTransactions extends StatelessWidget {
  const WalletTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {'type': '-', 'text': 'تم خصم 20 ج.م للرحلة رقم A15456'},
      {'type': 'in', 'text': 'تم استلام مبلغ 200 ج.م من “عمر علي”'},
      {'type': 'out', 'text': 'تم تحويل مبلغ 120 ج.م الى “مجدي عمرو”'},
      {'type': '+', 'text': 'تم شحن محفظتك بمبلغ 300 ج.م'},
    ];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade600,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'آخر العمليات المالية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          ...transactions.map((item) => Container(
                margin: const EdgeInsets.only(top: 6),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        item['text']!,
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Icon(
                      item['type'] == 'in'
                          ? Icons.arrow_downward_rounded
                          : item['type'] == 'out'
                              ? Icons.arrow_upward_rounded
                              : item['type'] == '+'
                                  ? Icons.add
                                  : Icons.remove,
                      color: item['type'] == 'in'
                          ? Colors.green
                          : item['type'] == 'out'
                              ? Colors.red
                              : Colors.black,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
