import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Dandy Candra Pratama',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Informasi Ditampilkan
              const Text(
                'Informasi Ditampilkan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              _buildInfoCard('Nama Lengkap', 'Dandy Candra Pratama'),
              const SizedBox(height: 12),
              _buildInfoCard('Email Institusi', 'dandy.candra@university.edu'),
              const SizedBox(height: 12),
              _buildInfoCard('Program Studi', 'Teknik Informatika'),
              const SizedBox(height: 12),
              _buildInfoCard('Fakultas', 'Fakultas Ilmu Komputer'),
              const SizedBox(height: 12),
              _buildInfoCard('Waktu Pertama Login', '15 Agustus 2025, 08:30'),
              const SizedBox(height: 12),
              _buildInfoCard('Login Terakhir', '22 Desember 2025, 14:25'),
              
              const SizedBox(height: 24),
              
              // Aksi
              const Text(
                'Aksi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              _buildActionCard(context),
              
              const SizedBox(height: 24),
              
              // Riwayat aktivitas login
              const Text(
                'Riwayat Aktivitas Login',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              _buildLoginHistoryCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle edit profile action
                _showEditProfileDialog(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Handle logout action
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginHistoryCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.login, color: Colors.green),
              title: Text('22 Desember 2025, 14:25'),
              subtitle: Text('Login dari: Windows, Chrome'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.login, color: Colors.green),
              title: Text('21 Desember 2025, 09:15'),
              subtitle: Text('Login dari: Windows, Firefox'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.login, color: Colors.green),
              title: Text('20 Desember 2025, 16:40'),
              subtitle: Text('Login dari: Android, Mobile App'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.login, color: Colors.green),
              title: Text('19 Desember 2025, 11:30'),
              subtitle: Text('Login dari: iOS, Mobile App'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.login, color: Colors.green),
              title: Text('18 Desember 2025, 13:20'),
              subtitle: Text('Login dari: Windows, Chrome'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: const Text('Fitur edit profile akan segera tersedia.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Apakah Anda yakin ingin logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // Handle logout action
                Navigator.of(context).pop();
                // In a real app, this would handle the logout process
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}