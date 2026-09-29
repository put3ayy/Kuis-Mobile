import 'package:flutter/material.dart';
import '../data/dummy_mhs.dart';
import '../models/mahasiswa.dart';
import '../theme/app_colors.dart';
import '../theme/text_styles.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/mahasiswa_card.dart';

class DataMahasiswaScreen extends StatefulWidget {
  const DataMahasiswaScreen({super.key});

  @override
  State<DataMahasiswaScreen> createState() => _DataMahasiswaScreenState();
}

class _DataMahasiswaScreenState extends State<DataMahasiswaScreen> {
  String _query = '';

  List<Mahasiswa> get _filtered => dummyMahasiswa
      .where((m) =>
          m.nama.toLowerCase().contains(_query.toLowerCase()) ||
          m.nim.contains(_query))
      .toList();

  void _showDetail(Mahasiswa m) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(m.nama, style: AppTextStyles.heading.copyWith(fontSize: 22)),
            const SizedBox(height: 16),
            _row(Icons.badge_outlined, 'NIM', m.nim),
            _row(Icons.home_outlined, 'Alamat', m.alamat),
            _row(Icons.email_outlined, 'Email', m.email),
            _row(Icons.sports_esports_outlined, 'Hobi', m.hobi ?? '-'),
            _row(Icons.phone_outlined, 'Telepon', m.telepon ?? '-'),
            _row(Icons.star_outline, 'IPK',
                m.ipk?.toStringAsFixed(2) ?? 'Belum ada'),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _row(IconData icon, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(width: 12),
            SizedBox(
                width: 70, child: Text(label, style: AppTextStyles.caption)),
            Expanded(child: Text(value, style: AppTextStyles.body)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    final data = _filtered;
    return Scaffold(
      appBar: AppBar(title: const Text('Data Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomTextField(
              label: 'Cari',
              hint: 'Nama atau NIM',
              icon: Icons.search,
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: data.isEmpty
                  ? Center(
                      child: Text('Data tidak ditemukan',
                          style: AppTextStyles.caption))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, i) => MahasiswaCard(
                        mahasiswa: data[i],
                        onTap: () => _showDetail(data[i]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}