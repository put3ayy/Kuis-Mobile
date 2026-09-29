import 'package:flutter/material.dart';
import '../data/dummy_mhs.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import '../widgets/info_card.dart';
import '../widgets/primary_button.dart';

class Homescreen extends StatelessWidget {
  final VoidCallback onOpenData;
  const Homescreen({super.key, required this.onOpenData});

  @override
  Widget build(BuildContext context) {
    final total = dummyMahasiswa.length;
    final withIpk = dummyMahasiswa.where((m) => m.ipk != null).toList();
    final avg = withIpk.isEmpty
        ? 0.0
        : withIpk.map((m) => m.ipk!).reduce((a, b) => a + b) / withIpk.length;

    return Scaffold(
      appBar: AppBar(title: const Text('Beranda')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Halo',
                    style: AppTextStyles.title.copyWith(color: Colors.white)),
                const SizedBox(height: 6),
                Text('Yuk Kelola data mahasiswa dengan mudah.',
                    style: AppTextStyles.body
                        .copyWith(color: AppColors.primaryLight)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InfoCard(
                  icon: Icons.people,
                  value: '$total',
                  label: 'Total Mahasiswa',
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: InfoCard(
                  icon: Icons.star,
                  value: avg.toStringAsFixed(2),
                  label: 'Rata-rata IPK',
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'Lihat Data Mahasiswa',
            icon: Icons.arrow_forward,
            onPressed: onOpenData,
          ),
        ],
      ),
    );
  }
}