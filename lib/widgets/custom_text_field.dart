import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hidden = true;

  OutlineInputBorder _border(Color color, {double width = 1}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: color, width: width),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
            style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && _hidden,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: AppTextStyles.body,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle:
                AppTextStyles.body.copyWith(color: AppColors.textSecondary),
            prefixIcon: Icon(widget.icon, color: AppColors.textSecondary),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _hidden ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textSecondary,
                    ),
                    onPressed: () => setState(() => _hidden = !_hidden),
                  )
                : null,
            filled: true,
            fillColor: AppColors.surface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: _border(AppColors.border),
            focusedBorder: _border(AppColors.primary, width: 1.8),
            errorBorder: _border(AppColors.error),
            focusedErrorBorder: _border(AppColors.error, width: 1.8),
          ),
        ),
      ],
    );
  }
}