import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        'color': Color(0xFFCF2236),
        'textColor': Color(0xFF550A0A),
        'border': Color(0xFFECECEC),
        'image': 'assets/images/literacy_skills.png',
      },
      {
        'title': 'Numeracy Skills',
        'desc': 'Use math to solve daily problems.',
        'status': 'Not Started',
        'color': Color(0xFF228ACF),
        'textColor': Color(0xFF0D0F57),
        'border': Color(0xFFECECEC),
        'image': 'assets/images/numeracy.png',
      },
      {
        'title': 'Thai Speaking',
        'desc': 'Speak Thai for everyday use',
        'status': '78%',
        'color': Color(0xFFFF9934),
        'textColor': Color(0xFF550A0A),
        'border': Color(0xFFECECEC),
        'image': 'assets/images/thai_speaking.png',
      },
      {
        'title': 'Life Skill',
        'desc': 'Everyday skills for work, health and life.',
        'status': 'Completed',
        'color': Color(0xFFCF22CF),
        'textColor': Color(0xFF240A55),
        'border': Color(0xFFECECEC),
        'image': 'assets/images/life_skill.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "👋 Welcome Ant, select a course.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
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
              width: double.infinity,
              height: 130,
              decoration: ShapeDecoration(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: Color(0xFFECECEC).withAlpha(100),
                  ),
                ),
                gradient: LinearGradient(
                  colors: [
                    (module['color'] as Color).withAlpha(30),
                    (module['color'] as Color).withAlpha(20),
                    (module['color'] as Color).withAlpha(10),
                    Color(0xFFFFFFFF).withAlpha(10),
                    Color(0xFFFFFFFF).withAlpha(10),
                    Color(0xFFFFFFFF).withAlpha(10),
                  ],
                ),
                shadows: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 1,
                    spreadRadius: 0.1,
                    color: Colors.black.withAlpha(70),
                  ),
                  BoxShadow(
                    color: Color(0xFFF4ECEC),
                  ),
                  BoxShadow(
                    offset: const Offset(0, -3),
                    blurRadius: 2,
                    color: Colors.white,
                  ),
                ],
              ),
              //color
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(module['image'] as String),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module['title'] as String,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: module['textColor'] as Color,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          module['desc'] as String,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
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
                            color: (module['color'] as Color).withOpacity(
                              0.1,
                            ),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
