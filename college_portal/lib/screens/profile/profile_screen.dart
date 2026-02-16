import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 60),
            ),
            const SizedBox(height: 16),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'john.doe@example.com',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            _buildProfileOption(
              context,
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
            ),
             _buildProfileOption(
              context,
              icon: Icons.notifications,
              title: 'Notifications',
              onTap: () {
                 Navigator.pushNamed(context, '/notifications');
              },
            ),
            _buildProfileOption(
              context,
              icon: Icons.history,
              title: 'Application History',
              onTap: () {},
            ),
            _buildProfileOption(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context,
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
