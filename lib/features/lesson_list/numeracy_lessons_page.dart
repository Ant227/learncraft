import 'package:flutter/material.dart';

class NumeracyLessonsPage extends StatelessWidget {
  const NumeracyLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {'title': 'Numbers in Daily Life', 'status': 'complete'},
      {'title': 'Adding & Subtracting', 'status': 'complete'},
      {'title': 'Time & Money', 'status': 'notStarted'},
      {'title': 'Everyday Math Problems', 'status': 'notStarted'},
      {'title': 'Estimating & Measuring', 'status': 'notStarted'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Course Detail'),
        centerTitle: true,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.1),
              image: const DecorationImage(
                image: AssetImage('assets/images/numeracy.png'),
                fit: BoxFit.contain,
                alignment: Alignment.centerRight,
                opacity: 0.6,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Numeracy Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Use math to solve daily problems.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 60,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '40%',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: lessons.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                return Card(
                  elevation: 1.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    title: Text(
                      'Lesson ${index + 1}: ${lesson['title']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: Icon(
                      lesson['status'] == 'complete'
                          ? Icons.check_circle
                          : lesson['status'] == 'inProgress'
                          ? Icons.play_circle_fill
                          : Icons.radio_button_unchecked,
                      color:
                          lesson['status'] == 'complete'
                              ? Colors.green
                              : lesson['status'] == 'inProgress'
                              ? Colors.blueAccent
                              : Colors.grey,
                      size: 28,
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
