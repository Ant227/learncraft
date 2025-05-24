import 'package:flutter/material.dart';

class LessonListPage extends StatelessWidget {
  final String moduleTitle;
  final String moduleSubtitle;
  final Color bannerColor;
  final List<Map<String, dynamic>> lessons;

  const LessonListPage({
    super.key,
    required this.moduleTitle,
    required this.moduleSubtitle,
    required this.bannerColor,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
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
          // Banner Header
          Container(
            width: double.infinity,
            color: bannerColor.withOpacity(0.1),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  moduleTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  moduleSubtitle,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          // Lesson List
          Expanded(
            child: ListView.builder(
              itemCount: lessons.length,
              itemBuilder: (context, index) {
                final lesson = lessons[index];
                IconData statusIcon;
                Color iconColor;

                switch (lesson['status']) {
                  case 'complete':
                    statusIcon = Icons.check_circle;
                    iconColor = Colors.green;
                    break;
                  case 'inProgress':
                    statusIcon = Icons.play_circle_fill;
                    iconColor = Colors.orange;
                    break;
                  default:
                    statusIcon = Icons.radio_button_unchecked;
                    iconColor = Colors.grey;
                }

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  title: Text(
                    'Lesson ${index + 1}: ${lesson['title']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  trailing: Icon(statusIcon, color: iconColor, size: 28),
                  onTap: () {
                    // TODO: Navigate to lesson content page
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
