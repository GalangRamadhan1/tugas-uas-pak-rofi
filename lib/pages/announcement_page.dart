  import 'package:flutter/material.dart';

class AnnouncementPage extends StatelessWidget {
  const AnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengumuman'),
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
                'Pengumuman',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              
              // Announcement 1
              _buildAnnouncementCard(
                'Maintenance Sistem LMS',
                'Admin IT',
                '24 Desember 2025, 22:00 - 24:00 WIB',
                'Sistem LMS akan dilakukan maintenance pada tanggal 25 Desember 2025 pukul 22:00 - 24:00 WIB. Selama periode tersebut, sistem akan tidak dapat diakses. Mohon maaf atas ketidaknyamanannya.',
              ),
              const SizedBox(height: 16),
              
              // Announcement 2
              _buildAnnouncementCard(
                'Pengumuman Jadwal Ujian Tengah Semester',
                'Admin Akademik',
                '23 Desember 2025, 15:30 WIB',
                'Jadwal Ujian Tengah Semester telah diumumkan dan dapat diakses di halaman akademik. Silakan cek jadwal Anda masing-masing dan persiapkan diri dengan baik.',
              ),
              const SizedBox(height: 16),
              
              // Announcement 3
              _buildAnnouncementCard(
                'Libur Akhir Tahun',
                'Admin Umum',
                '22 Desember 2025, 10:15 WIB',
                'Kampus akan libur mulai tanggal 25 Desember 2025 hingga 5 Januari 2026. Aktivitas perkuliahan akan dilanjutkan pada tanggal 6 Januari 2026.',
              ),
              const SizedBox(height: 16),
              
              // Announcement 4
              _buildAnnouncementCard(
                'Pengumuman Jadwal Konsultasi Dosen',
                'Admin Akademik',
                '21 Desember 2025, 14:20 WIB',
                'Jadwal konsultasi dosen untuk semester ganjil 2025/2026 telah diperbarui. Silakan cek di halaman masing-masing mata kuliah untuk informasi lebih lanjut.',
              ),
              const SizedBox(height: 16),
              
              // Announcement 5
              _buildAnnouncementCard(
                'Panduan Pengisian KRS Semester Genap',
                'Admin Akademik',
                '20 Desember 2025, 09:45 WIB',
                'Panduan pengisian KRS untuk semester genap 2025/2026 telah tersedia. Silakan mengakses panduan tersebut melalui portal akademik.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard(
    String title,
    String adminName,
    String dateTime,
    String content,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.campaign,
                    color: Colors.blue,
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
                        'Oleh: $adminName',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        dateTime,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}