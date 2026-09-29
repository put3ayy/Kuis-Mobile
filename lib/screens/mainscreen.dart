import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'data_mhs.dart';
import 'homescreen.dart' as home;
import 'logout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  void _goTo(int i) => setState(() => _index = i);

  @override
  Widget build(BuildContext context) {
    final pages = [
      home.Homescreen(onOpenData: () => _goTo(1)),
      const DataMahasiswaScreen(),
      LogoutScreen(onCancel: () => _goTo(0)),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: _goTo,
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primaryLight,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Mahasiswa',
          ),
          NavigationDestination(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}