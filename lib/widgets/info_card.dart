import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const InfoCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 14),
          Text(
            value,
            style: AppTextStyles.heading.copyWith(fontSize: 24),
          ),
          Text(
            label,
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}