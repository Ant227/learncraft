import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learncraft/data/bloc/module/module_cubit.dart';
import 'package:learncraft/data/models/module_model.dart';
import 'package:learncraft/features/lesson_list/audio_lesson.dart';
import 'package:learncraft/features/modules/module_details.dart';

class ModuleSelectionPage extends StatefulWidget {
  const ModuleSelectionPage({super.key});

  @override
  State<ModuleSelectionPage> createState() => _ModuleSelectionPageState();
}

class _ModuleSelectionPageState extends State<ModuleSelectionPage> {
  @override
  void initState() {
    context.read<ModuleCubit>().getModules();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "👋 Welcome, select a course.",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
      body: BlocBuilder<ModuleCubit, ModuleState>(
        builder: (BuildContext context, state) {
          if (state is ModuleLoading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is ModuleSuccess) {
            List<ModuleModel> modules = state.modules;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              itemCount: modules.length,
              separatorBuilder: (_, __) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final ModuleModel module = modules[index];
                int borderColor = int.parse(module.border);
                int textColor = int.parse(module.textColor);
                int color = int.parse(module.color);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ModuleDetailsScreen(module: module),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: ShapeDecoration(
                      shape: RoundedSuperellipseBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: Color(borderColor).withAlpha(100),
                        ),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(color).withAlpha(30),
                          Color(color).withAlpha(20),
                          Color(color).withAlpha(10),
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
                            child: CachedNetworkImage(imageUrl: module.image),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                  color: Color(color).withOpacity(
                                    0.1,
                                  ),
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
                );
              },
            );
          }

          if (state is ModuleFail) {
            return Center(
              child: Text(state.message),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
