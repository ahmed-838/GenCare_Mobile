import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SizedBox(
      width: 304,
      child: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      theme.primaryColor,
                      theme.primaryColor.withBlue(theme.primaryColor.blue + 15),
                    ],
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/icon/icon.png',
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    _buildDrawerItem(
                      icon: Icons.home,
                      title: 'الرئيسية',
                      onTap: () => Navigator.pushNamed(context, '/'),
                    ),
                    _buildDrawerItem(
                      icon: Icons.person,
                      title: 'الملف الشخصي',
                      onTap: () => Navigator.pushNamed(context, '/profile'),
                    ),
                    _buildDrawerItem(
                      icon: Icons.settings,
                      title: 'الإعدادات',
                      onTap: () => Navigator.pushNamed(context, '/settings'),
                    ),
                  ],
                ),
              ),
              const Divider(),
              _buildDrawerItem(
                icon: Icons.logout,
                title: 'تسجيل الخروج',
                onTap: () {
                  // تنفيذ عملية تسجيل الخروج
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
      dense: true,
    );
  }
} 