import 'package:flutter/material.dart';

import '../lesson_list/literacy_lessons_page.dart';

class ModuleSelectionPage extends StatelessWidget {
  const ModuleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      {
        'title': 'Literacy Skills',
        'desc': 'Reading and writing for a better learning.',
        'status': 'Not Started',
        'color': Colors.redAccent,
        'border': Color(0xFFECECEC),
        'image': 'assets/images/literacy_skills.png',
      },
      {
        'title': 'Numeracy Skills',
        'desc': 'Use math to solve daily problems.',
        'status': 'Not Started',
        'color': Colors.blueAccent,
        'border': Color(0xFFECECEC),
        'image': 'assets/images/numeracy.png',
      },
      {
        'title': 'Thai Speaking',
        'desc': 'Speak Thai for everyday use',
        'status': '78%',
        'color': Colors.orangeAccent,
        'border': Color(0xFFECECEC),
        'image': 'assets/images/thai_speaking.png',
      },
      {
        'title': 'Life Skill',
        'desc': 'Everyday skills for work, health and life.',
        'status': 'Completed',
        'color': Colors.purple,
        'border': Color(0xFFECECEC),
        'image': 'assets/images/life_skill.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Welcome Ant, select a course."),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemCount: modules.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final module = modules[index];
          return GestureDetector(
            onTap: () {
              final title = module['title'] as String;

              if (title == 'Literacy Skills') {
                Navigator.pushNamed(context, '/literacy');
              } else if (title == 'Numeracy Skills') {
                Navigator.pushNamed(context, '/numeracy');
              } else if (title == 'Thai Speaking') {
                Navigator.pushNamed(context, '/thai');
              } else if (title == 'Life Skill') {
                Navigator.pushNamed(context, '/life');
              }
            },

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: module['border'] as Color),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Left: Text section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module['title'] as String,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          module['desc'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: (module['color'] as Color).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            module['status'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: module['color'] as Color,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Right: Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      module['image'] as String,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
