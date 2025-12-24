import 'package:flutter/material.dart';
import 'dart:async';

class QuizTakingPage extends StatefulWidget {
  const QuizTakingPage({super.key});

  @override
  State<QuizTakingPage> createState() => _QuizTakingPageState();
}

class _QuizTakingPageState extends State<QuizTakingPage> {
  int _currentQuestionIndex = 0;
  int _timeLeft = 1800; // 30 minutes in seconds
  Map<int, String> _answers = {};
  Timer? _timer;

  // Sample quiz questions
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa kepanjangan dari API dalam konteks pemrograman?',
      'options': [
        'Application Programming Interface',
        'Advanced Programming Interface',
        'Application Process Integration',
        'Advanced Process Integration'
      ],
    },
    {
      'question': 'Dalam Flutter, widget manakah yang digunakan untuk membuat tata letak horizontal?',
      'options': [
        'Column',
        'Row',
        'Stack',
        'Container'
      ],
    },
    {
      'question': 'Apa fungsi dari StatelessWidget dalam Flutter?',
      'options': [
        'Mengelola state aplikasi',
        'Menyimpan data pengguna',
        'Membuat widget yang tidak berubah',
        'Mengatur navigasi'
      ],
    },
    {
      'question': 'Apa yang dimaksud dengan hot reload dalam Flutter?',
      'options': [
        'Memulai ulang aplikasi secara lengkap',
        'Memperbarui UI tanpa kehilangan state',
        'Menghapus semua data aplikasi',
        'Menyimpan aplikasi ke cloud'
      ],
    },
    {
      'question': 'Widget manakah yang digunakan untuk membuat tombol dalam Flutter?',
      'options': [
        'Button',
        'Click',
        'Tap',
        'ElevatedButton'
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _finishQuiz();
        }
      });
    });
  }

  void _finishQuiz() {
    _timer?.cancel();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Waktu Habis'),
          content: const Text('Waktu pengerjaan kuis telah habis.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to quiz page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _selectAnswer(String answer) {
    setState(() {
      _answers[_currentQuestionIndex] = answer;
    });
  }

  void _goToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  void _submitQuiz() {
    _timer?.cancel();
    int correctAnswers = 0;
    // In a real app, we would have correct answers to compare
    // For now, we'll just show a completion dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kuis Selesai'),
          content: const Text('Jawaban Anda telah dikirim.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to quiz page
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mengerjakan Kuis'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        foregroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _formatTime(_timeLeft),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Question counter
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Soal ${_currentQuestionIndex + 1} dari ${_questions.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Question card
            Expanded(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _questions[_currentQuestionIndex]['question'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Options
                      ...List.generate(
                        _questions[_currentQuestionIndex]['options'].length,
                        (index) {
                          String option = _questions[_currentQuestionIndex]['options'][index];
                          bool isSelected = _answers[_currentQuestionIndex] == option;
                          
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _answers[_currentQuestionIndex],
                              onChanged: (String? value) {
                                if (value != null) {
                                  _selectAnswer(value);
                                }
                              },
                              activeColor: Colors.blue,
                              selected: isSelected,
                              selectedTileColor: Colors.blue[50],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Navigation buttons
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _currentQuestionIndex > 0 ? _goToPreviousQuestion : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.grey[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Sebelumnya',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _currentQuestionIndex < _questions.length - 1 
                            ? _goToNextQuestion 
                            : _submitQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          _currentQuestionIndex < _questions.length - 1 
                              ? 'Berikutnya' 
                              : 'Kumpulkan',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
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