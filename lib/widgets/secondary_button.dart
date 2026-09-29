import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isDanger;

  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDanger ? AppColors.error : AppColors.primary;
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(label, style: AppTextStyles.button.copyWith(color: color)),
      ),
    );
  }
}