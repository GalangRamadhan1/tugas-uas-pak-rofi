import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifikasi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              
              // Pengumpulan tugas berhasil
              _buildNotificationCard(
                'Pengumpulan Tugas Berhasil',
                'Tugas Besar Pemrograman Mobile berhasil dikumpulkan',
                '22 Des 2025, 10:30',
                Colors.green,
                Icons.check_circle,
              ),
              const SizedBox(height: 12),
              
              // Pengumuman maintenance
              _buildNotificationCard(
                'Pengumuman Maintenance',
                'Sistem akan maintenance pada tanggal 25 Desember 2025 pukul 22:00 - 24:00 WIB',
                '21 Des 2025, 15:45',
                Colors.orange,
                Icons.warning,
              ),
              const SizedBox(height: 12),
              
              // Informasi akademik
              _buildNotificationCard(
                'Informasi Akademik',
                'Jadwal Ujian Tengah Semester telah diumumkan, silakan cek di halaman akademik',
                '20 Des 2025, 09:20',
                Colors.blue,
                Icons.school,
              ),
              const SizedBox(height: 12),
              
              // More notifications
              _buildNotificationCard(
                'Pengumpulan Tugas Berhasil',
                'Quiz Algoritma dan Struktur Data berhasil dikumpulkan',
                '19 Des 2025, 14:15',
                Colors.green,
                Icons.check_circle,
              ),
              const SizedBox(height: 12),
              
              _buildNotificationCard(
                'Informasi Akademik',
                'Pengumuman jadwal konsultasi dosen telah diperbarui',
                '18 Des 2025, 11:30',
                Colors.blue,
                Icons.school,
              ),
              const SizedBox(height: 12),
              
              _buildNotificationCard(
                'Pengumuman Maintenance',
                'Update sistem dilakukan pada tanggal 20 Desember 2025',
                '17 Des 2025, 16:45',
                Colors.orange,
                Icons.warning,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    String title,
    String content,
    String time,
    Color iconColor,
    IconData icon,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    content,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}