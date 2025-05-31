import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learncraft/data/bloc/lesson_detail/lesson_detail_cubit.dart';
import 'package:learncraft/data/models/lesson_model.dart';

class AudioLesson extends StatefulWidget {
  const AudioLesson({
    super.key,
    required this.lesson,
  });
  final LessonModel lesson;

  @override
  AudioLessonState createState() => AudioLessonState();
}

class AudioLessonState extends State<AudioLesson> {
  @override
  void initState() {
    context.read<LessonDetailCubit>().getLessonDetailByLesson(widget.lesson.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lesson.description,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: BlocBuilder<LessonDetailCubit, LessonDetailState>(
        builder: (BuildContext context, state) {
          if (state is LessonDetailLoading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state is LessonDetailSuccess) {
            List<LessonDetailModel> lessonDetails = state.lessonDetails;
            if (lessonDetails.isEmpty) {
              return Center(
                child: Text(('No data yet')),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: lessonDetails.length,
              separatorBuilder: (_, __) => const SizedBox(height: 32),
              itemBuilder: (context, index) {
                final LessonDetailModel lessonDetail = lessonDetails[index];
                return PlayAudioItem(lessonDetail: lessonDetail);
              },
            );
          }
          if (state is LessonDetailFail) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class PlayAudioItem extends StatefulWidget {
  const PlayAudioItem({
    super.key,
    required this.lessonDetail,
  });
  final LessonDetailModel lessonDetail;

  @override
  State<PlayAudioItem> createState() => _PlayAudioItemState();
}

class _PlayAudioItemState extends State<PlayAudioItem> {
  late AudioPlayer _player;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setUrl(widget.lessonDetail.audioLink);

    _player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        setState(() {
          _isCompleted = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Color(0xFFE6E6E6)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  StreamBuilder<PlayerState>(
                    stream: _player.playerStateStream,
                    builder: (context, snapshot) {
                      final playerState = snapshot.data;
                      final playing = playerState?.playing ?? false;
                      final processingState = playerState?.processingState;

                      if (processingState == ProcessingState.loading ||
                          processingState == ProcessingState.buffering) {
                        return IconButton(
                          iconSize: 32,
                          icon: const CupertinoActivityIndicator(),
                          onPressed: () {},
                        );
                      } else if (playing && !_isCompleted) {
                        return IconButton(
                          icon: SvgPicture.asset('assets/images/pause.svg'),
                          iconSize: 32,
                          onPressed: () {
                            _player.pause();
                          },
                        );
                      } else {
                        return IconButton(
                          icon: SvgPicture.asset('assets/images/play.svg'),
                          iconSize: 32,
                          onPressed: () {
                            if (_isCompleted) {
                              _player.seek(Duration.zero);
                              _isCompleted = false;
                            }
                            _player.play();
                          },
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SvgPicture.asset('assets/images/audio_wave.svg'),
                  ),
                ],
              ),

              // Slider and time
              StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (context, positionSnapshot) {
                  final position = positionSnapshot.data ?? Duration.zero;

                  return StreamBuilder<Duration?>(
                    stream: _player.durationStream,
                    builder: (context, durationSnapshot) {
                      final duration = durationSnapshot.data ?? Duration.zero;
                      final max = duration.inMilliseconds.toDouble();
                      final value = position.inMilliseconds
                          .clamp(0, max)
                          .toDouble();

                      return Column(
                        children: [
                          const SizedBox(height: 16),
                          Slider(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            value: value,
                            max: max > 0 ? max : 1,
                            activeColor: Color(0xFFFF9934),
                            inactiveColor: Colors.grey[300],
                            onChanged: (newValue) {
                              _player.seek(
                                Duration(milliseconds: newValue.toInt()),
                              );
                            },
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(position),
                                style: const TextStyle(fontSize: 12),
                              ),
                              Text(
                                _formatDuration(duration),
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: Color(0xFFE6E6E6)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            widget.lessonDetail.note,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
