import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learncraft/data/models/module_model.dart';

class CourseDetailAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ModuleModel module;
  final VoidCallback? onBack;

  const CourseDetailAppBar({
    super.key,
    required this.module,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    int textColor = int.parse(module.textColor);
    int color = int.parse(module.color);
    return AppBar(
      toolbarHeight: 200,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox.shrink(), // For alignment with Row()
                  Text(
                    module.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(textColor),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    module.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      module.status,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(color),
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
      flexibleSpace: Container(
        decoration: ShapeDecoration(
          shape: RoundedSuperellipseBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: const Color(0xFFECECEC).withAlpha(100),
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Color(color).withAlpha(30),
              Color(color).withAlpha(20),
              Color(color).withAlpha(10),
              const Color(0xFFFFFFFF).withAlpha(10),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CachedNetworkImage(
              imageUrl: module.image,
              height: 140,
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBack ?? () => Navigator.pop(context),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Course Detail',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
          const SizedBox(width: 32),
        ],
      ),
    );
  }
}
