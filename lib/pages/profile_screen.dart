import 'package:flutter/material.dart';
import '../placeholder/placeholder_screen.dart'; 

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Define your settings in a list
  final List<Map<String, String>> settings = const [
    {
      'title': 'Manage Account',
      'subtitle': 'Update information and manage your account',
    },
    {
      'title': 'Payment',
      'subtitle': 'Manage payment methods and credits',
    },
    {
      'title': 'Address',
      'subtitle': 'Add or remove a delivery address',
    },
    {
      'title': 'Notifications',
      'subtitle': 'Manage delivery and promotional notifications',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Account Settings Title
              Text(
                'Account Settings',
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Render settings dynamically
              ...settings.map((item) => buildSettingsItem(
                    context,
                    item['title']!,
                    item['subtitle']!,
                  )),

              const SizedBox(height: 30),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDark ? Colors.grey.shade800 : Colors.pink.shade50,
                    foregroundColor: isDark ? Colors.white : Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Settings item widget
  Widget buildSettingsItem(BuildContext context, String title, String subtitle) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: theme.colorScheme.secondary),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaceholderScreen(title: title),
          ),
        );
      },
    );
  }
}
