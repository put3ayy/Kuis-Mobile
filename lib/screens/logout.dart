import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';
import 'login.dart';

class LogoutScreen extends StatelessWidget {
  final VoidCallback onCancel;
  const LogoutScreen({super.key, required this.onCancel});

  void _logout(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logout')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: const BoxDecoration(
                  color: AppColors.primaryLight,
                  shape: BoxShape.circle,
                ),
                child:
                    const Icon(Icons.logout, size: 44, color: AppColors.error),
              ),
              const SizedBox(height: 24),
              Text('Keluar dari akun?', style: AppTextStyles.heading),
              const SizedBox(height: 8),
              Text('Kamu harus login lagi untuk mengakses data.',
                  textAlign: TextAlign.center, style: AppTextStyles.caption),
              const SizedBox(height: 32),
              PrimaryButton(label: 'Batal', onPressed: onCancel),
              const SizedBox(height: 12),
              SecondaryButton(
                label: 'Ya, Logout',
                isDanger: true,
                onPressed: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}