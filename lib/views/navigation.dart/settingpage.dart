import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Settings',
            style: TextStyle(
                fontSize: 25, letterSpacing: 1.5, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Theme Settings'),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.dark_mode, color: Colors.red),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: false, // Change this based on user preference
                onChanged: (bool newValue) {
                  // Handle the theme change
                },
              ),
            ),
          ),
          _buildSectionTitle('Notification Settings'),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.red),
              title: const Text('Enable Notifications'),
              trailing: Switch(
                value: true, // Change this based on user preference
                onChanged: (bool newValue) {
                  // Handle the notification setting change
                },
              ),
            ),
          ),
          _buildSectionTitle('Account Management'),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.person, color: Colors.red),
              title: const Text('Profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Profile page
              },
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.password, color: Colors.red),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Change Password page
              },
            ),
          ),
          _buildSectionTitle('App Settings'),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.language, color: Colors.red),
              title: const Text('Language'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Language settings page
              },
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.privacy_tip, color: Colors.red),
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Privacy Policy page
              },
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.help, color: Colors.red),
              title: const Text('Help & Support'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Help & Support page
              },
            ),
          ),
          Card(
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle Logout action
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}
