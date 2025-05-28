import 'package:flutter/material.dart';

class LifeLessonsPage extends StatelessWidget {
  const LifeLessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {'title': 'Smart Daily Decisions', 'status': 'complete'},
      {'title': 'Planning & Organizing Tasks', 'status': 'complete'},
      {'title': 'Money & Budgeting', 'status': 'complete'},
      {'title': 'Communicating Clearly', 'status': 'complete'},
      {'title': 'Solving Real-Life Problems', 'status': 'complete'},
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
              color: Colors.purple.withOpacity(0.1),
              image: const DecorationImage(
                image: AssetImage('assets/images/life_skill.png'),
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
                  'Life Skill',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Everyday skills for work, health and life.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Container(
                  width: 60,
                  height: 22,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '100%',
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
                      Icons.check_circle,
                      color: Colors.green,
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
