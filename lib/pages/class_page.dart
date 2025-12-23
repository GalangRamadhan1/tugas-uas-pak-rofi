import 'package:flutter/material.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Kelas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              
              // Class 1: Desain Antarmuka & Pengalaman Pengguna
              _buildClassCard(
                context,
                'Desain Antarmuka & Pengalaman Pengguna',
                'IF4021',
                'Dr. Siti Rahayu',
                'Ganjil 2025/2026',
                '10 September 2025',
                0.85,
              ),
              
              const SizedBox(height: 16),
              
              // Class 2: Sistem Operasi
              _buildClassCard(
                context,
                'Sistem Operasi',
                'IF3015',
                'Prof. Budi Santoso',
                'Ganjil 2025/2026',
                '10 September 2025',
                0.60,
              ),
              
              const SizedBox(height: 16),
              
              // Class 3: Pemrograman Multimedia Interaktif
              _buildClassCard(
                context,
                'Pemrograman Multimedia Interaktif',
                'IF4030',
                'Dr. Ahmad Fauzi',
                'Ganjil 2025/2026',
                '10 September 2025',
                0.40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClassCard(
    BuildContext context,
    String courseName,
    String classCode,
    String lecturerName,
    String semester,
    String startDate,
    double progress,
  ) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to detail class page
                Navigator.pushNamed(context, '/detail-class');
              },
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: _getColorForCourse(courseName),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getIconForCourse(courseName),
                      color: _getTextColorForCourse(courseName),
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseName,
                          style: const TextStyle(
                            fontSize: 16,
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
                        Text(
                          'Dosen: $lecturerName',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Semester: $semester',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tanggal Mulai: $startDate',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Progress Penyelesaian',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _getProgressColor(progress),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: _getProgressColor(progress),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForCourse(String courseName) {
    if (courseName.contains('Desain')) {
      return Colors.blue[200]!;
    } else if (courseName.contains('Sistem')) {
      return Colors.green[200]!;
    } else if (courseName.contains('Pemrograman')) {
      return Colors.purple[200]!;
    }
    return Colors.grey[200]!;
  }

  Color _getTextColorForCourse(String courseName) {
    if (courseName.contains('Desain')) {
      return Colors.blue;
    } else if (courseName.contains('Sistem')) {
      return Colors.green;
    } else if (courseName.contains('Pemrograman')) {
      return Colors.purple;
    }
    return Colors.grey;
  }

  IconData _getIconForCourse(String courseName) {
    if (courseName.contains('Desain')) {
      return Icons.design_services;
    } else if (courseName.contains('Sistem')) {
      return Icons.settings;
    } else if (courseName.contains('Pemrograman')) {
      return Icons.code;
    }
    return Icons.book;
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