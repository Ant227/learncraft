import 'package:flutter/material.dart';

class LiteracyLessonsPage extends StatelessWidget {
  const LiteracyLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {'title': 'Words & Sentences', 'status': 'complete'},
      {'title': 'Reading for Everyday Use', 'status': 'complete'},
      {'title': 'Writing Simple Messages & Notes', 'status': 'complete'},
      {'title': 'Finding Information in Texts', 'status': 'notStarted'},
      {'title': 'Improving Reading Speed', 'status': 'inProgress'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Course Detail'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Colored header
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.1),
              image: const DecorationImage(
                image: AssetImage('assets/images/literacy_skills.png'),
                fit: BoxFit.contain,
                alignment: Alignment.centerRight, // 🔁 Image only on the right
                opacity: 0.6, // ✅ Optional: fade the image
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Literacy Skills',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Reading and writing for a better learning.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '80%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Lesson list
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
                              ? Colors.redAccent
                              : Colors.grey,
                      size: 28,
                    ),
                    onTap: () {
                      // TODO: Navigate to lesson content
                    },
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
