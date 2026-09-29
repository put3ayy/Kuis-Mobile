import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import 'mainscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameC = TextEditingController();
  final _passwordC = TextEditingController();
  bool _loading = false;

  static const _user = 'admin';
  static const _pass = 'admin123';

  @override
  void dispose() {
    _usernameC.dispose();
    _passwordC.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() => _loading = false);

    if (_usernameC.text == _user && _passwordC.text == _pass) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.error,
          content: Text('Username atau password salah',
              style: AppTextStyles.body.copyWith(color: Colors.white)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                        const Icon(Icons.school, color: Colors.white, size: 36),
                  ),
                  const SizedBox(height: 24),
                  Text('Selamat Datang di My Mahasiswa App', style: AppTextStyles.heading),
                  const SizedBox(height: 4),
                  Text('Masuk untuk mengelola data mahasiswa',
                      style: AppTextStyles.caption.copyWith(fontSize: 14)),
                  const SizedBox(height: 32),
                  CustomTextField(
                    label: 'Username',
                    hint: 'Masukkan username',
                    icon: Icons.person_outline,
                    controller: _usernameC,
                    validator: (v) => (v == null || v.isEmpty)
                        ? 'Username wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 18),
                  CustomTextField(
                    label: 'Password',
                    hint: 'Masukkan password',
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _passwordC,
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Password wajib diisi';
                      if (v.length < 6) return 'Minimal 6 karakter';
                      return null;
                    },
                  ),
                  const SizedBox(height: 28),
                  PrimaryButton(
                    label: 'Masuk',
                    icon: Icons.login,
                    isLoading: _loading,
                    onPressed: _login,
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text('Demo: admin / admin123',
                        style: AppTextStyles.caption),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}