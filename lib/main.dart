import 'package:flutter/material.dart';
import 'main_page.dart';
import 'pages/notification_page.dart';
import 'pages/edit_profile_page.dart';
import 'pages/detail_class_page.dart';
import 'pages/announcement_page.dart';
import 'pages/assignment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
      routes: {
        '/notifications': (context) => const NotificationPage(),
        '/edit-profile': (context) => const EditProfilePage(),
        '/detail-class': (context) => const DetailClassPage(
          className: 'Pemrograman Mobile',
          classCode: 'IF4021',
          lecturerName: 'Dr. Siti Rahayu',
          semester: 'Ganjil 2025/2026',
          startDate: '10 September 2025',
          progress: 0.85,
        ),
        '/announcements': (context) => const AnnouncementPage(),
        '/assignment': (context) => const AssignmentPage(
          assignmentTitle: 'Tugas Besar Flutter',
          assignmentDescription: 'Buat aplikasi Flutter sederhana yang mengimplementasikan konsep-konsep dasar state management, navigasi antar halaman, dan penggunaan widget dasar. Aplikasi harus memiliki minimal 3 halaman dengan navigasi yang baik dan tata letak yang rapi.',
          deadline: '30 Januari 2026',
          isSubmitted: false,
          fileName: 'tugas_besar_flutter.pdf',
          fileSize: '2.4 MB',
          fileStatus: 'Terkirim',
        ),
      },
    );
  }
}