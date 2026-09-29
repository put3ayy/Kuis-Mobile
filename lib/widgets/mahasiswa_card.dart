import 'package:flutter/material.dart';
import '../models/mahasiswa.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class MahasiswaCard extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final VoidCallback? onTap;

  const MahasiswaCard({super.key, required this.mahasiswa, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: AppColors.primaryLight,
          child: Text(
            mahasiswa.nama[0].toUpperCase(),
            style: AppTextStyles.title.copyWith(color: AppColors.primary),
          ),
        ),
        title: Text(mahasiswa.nama,
            style: AppTextStyles.title.copyWith(fontSize: 15)),
        subtitle: Text('NIM ${mahasiswa.nim}', style: AppTextStyles.caption),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            mahasiswa.ipk != null ? mahasiswa.ipk!.toStringAsFixed(2) : '-',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.primaryDark,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}