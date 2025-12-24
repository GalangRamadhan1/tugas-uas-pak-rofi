import 'package:flutter/material.dart';

class DetailClassPage extends StatelessWidget {
  final String className;
  final String classCode;
  final String lecturerName;
  final String semester;
  final String startDate;
  final double progress;
  
  const DetailClassPage({
    super.key,
    required this.className,
    required this.classCode,
    required this.lecturerName,
    required this.semester,
    required this.startDate,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(className),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Class Header
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        className,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Kode: $classCode',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dosen: $lecturerName',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Semester: $semester',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tanggal Mulai: $startDate',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Progress Penyelesaian',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Text(
                            '${(progress * 100).toInt()}%',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: _getProgressColor(progress),
                            ),
                          ),
                        ],
                      ),
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getProgressColor(progress),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Deskripsi mata kuliah
              const Text(
                'Deskripsi Mata Kuliah',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Mata kuliah ini membahas konsep-konsep dasar dalam pengembangan perangkat lunak mobile dengan fokus pada pengembangan aplikasi menggunakan framework Flutter. Mahasiswa akan mempelajari arsitektur aplikasi mobile, manajemen state, integrasi API, dan best practices dalam pengembangan aplikasi.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Materi per pertemuan
              const Text(
                'Materi per Pertemuan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Struktur Pertemuan
              _buildMeetingStructure(),
              
              const SizedBox(height: 24),
              
              // Tugas
              const Text(
                'Tugas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildAssignmentCard(context),
              const SizedBox(height: 16),
              
              // Kuis
              const Text(
                'Kuis',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildQuizCard(context),
              const SizedBox(height: 16),
              
              // Link Zoom
              const Text(
                'Link Zoom',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildZoomLinkCard(),
              const SizedBox(height: 16),
              
              // File & URL materi
              const Text(
                'File & URL Materi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              _buildMaterialFilesCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeetingStructure() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 1; i <= 6; i++)
              _buildMeetingCard(i),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingCard(int meetingNumber) {
    String title = '';
    String material = '';
    String assignment = '';
    
    switch (meetingNumber) {
      case 1:
        title = 'Pengenalan Flutter';
        material = 'Introduction to Flutter Framework';
        assignment = 'Tugas 1: Setup Environment';
        break;
      case 2:
        title = 'Widget Dasar';
        material = 'Basic Widgets in Flutter';
        assignment = 'Tugas 2: Basic UI Components';
        break;
      case 3:
        title = 'Layout dan Styling';
        material = 'Layout Widgets and Styling';
        assignment = 'Tugas 3: Create Responsive Layout';
        break;
      case 4:
        title = 'State Management';
        material = 'Managing State in Flutter';
        assignment = 'Kuis 1: State Management';
        break;
      case 5:
        title = 'Navigation dan Routing';
        material = 'Navigation in Flutter Apps';
        assignment = 'Tugas 4: Navigation Implementation';
        break;
      case 6:
        title = 'API Integration';
        material = 'Working with APIs in Flutter';
        assignment = 'Tugas 5: API Integration';
        break;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        title: Text(
          'Pertemuan $meetingNumber: $title',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Materi: $material',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.insert_drive_file, size: 16, color: Colors.blue),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Materi_Pertemuan_$meetingNumber.pdf',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  assignment.contains('Kuis') 
                    ? 'Kuis: $assignment' 
                    : 'Tugas: $assignment',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssignmentCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.assignment,
                  color: Colors.red,
                ),
              ),
              title: const Text(
                'Tugas Besar Flutter',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Batas pengumpulan: 30 Januari 2026'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Segera',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                // Navigate to assignment page
                Navigator.pushNamed(context, '/assignment');
              },
            ),
            const Divider(),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.assignment,
                  color: Colors.orange,
                ),
              ),
              title: const Text(
                'Tugas Mingguan 3',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Batas pengumpulan: 10 Januari 2026'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Mendekat',
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                // Navigate to assignment page
                Navigator.pushNamed(context, '/assignment');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizCard(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.quiz,
                  color: Colors.green,
                ),
              ),
              title: const Text(
                'Kuis 1: State Management',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Batas pengerjaan: 15 Januari 2026'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Tersedia',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () {
                // Navigate to quiz page
                Navigator.pushNamed(context, '/quiz');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZoomLinkCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Link Zoom Kelas',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue),
              ),
              child: Row(
                children: [
                  const Icon(Icons.videocam, color: Colors.blue),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'https://zoom.us/j/123456789',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const Icon(Icons.copy, size: 16, color: Colors.blue),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMaterialFilesCard() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.insert_drive_file,
                  color: Colors.blue,
                ),
              ),
              title: const Text('Materi Pertemuan 1 - Pengenalan Flutter'),
              subtitle: const Text('PDF • 2.4 MB'),
              trailing: const Icon(Icons.download, color: Colors.blue),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.insert_drive_file,
                  color: Colors.blue,
                ),
              ),
              title: const Text('Materi Pertemuan 2 - Widget Dasar'),
              subtitle: const Text('PDF • 3.1 MB'),
              trailing: const Icon(Icons.download, color: Colors.blue),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.insert_drive_file,
                  color: Colors.blue,
                ),
              ),
              title: const Text('Slide Presentasi Flutter'),
              subtitle: const Text('PPT • 5.2 MB'),
              trailing: const Icon(Icons.download, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Color _getProgressColor(double progress) {
    if (progress >= 0.8) {
      return Colors.green;
    } else if (progress >= 0.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}