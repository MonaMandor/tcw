import 'package:flutter/material.dart';
import 'package:tcw/core/constansts/context_extensions.dart';
import 'package:tcw/core/theme/app_colors.dart';
import 'package:tcw/features/courses/data/models/lesson_model.dart';
import 'package:tcw/features/courses/presentation/pages/courses_screen.dart';
import 'package:tcw/features/courses/presentation/widgets/course_list.dart';
import 'package:tcw/features/courses/presentation/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/services.dart';

class LessonScreen extends StatefulWidget {
  final LessonModel lessonModel;
  const LessonScreen({super.key, required this.lessonModel});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.propHeight(32),
              ),
              Row(
                children: [
                  // back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Understanding Concept Of React",
                    style: context.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Ramy Badr • Sun, 9 March 2025",
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: context.propHeight(16)),

              /// Video Player Widget
              VideoPlayerWidget(
                  videoUrl:
                      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),

              SizedBox(height: context.propHeight(16)),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F080F34),
                      blurRadius: 42,
                      offset: Offset(0, 14),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: ShapeDecoration(
                        color: const Color(0x33B7924F),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text("Lesson 6",
                          style: context.textTheme.labelMedium?.copyWith(
                              fontSize: 12, color: AppColors.primaryColor)),
                    ),
                    SizedBox(height: context.propHeight(8)),
                    Text("React Hooks Basics",
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: context.propHeight(8)),
                    Text(
                      "This lesson covers how to apply styles dynamically and conditionally...,This lesson covers how to apply styles dynamically and conditionally...",
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF9E9E9E),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.propHeight(16)),
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x0F080F34),
                      blurRadius: 42,
                      offset: Offset(0, 14),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Task",
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )),
                    SizedBox(height: context.propHeight(8)),
                    Container(
                      width: double.infinity,
                      height: 207,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFAFAFB),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: const Color(0xFFF1F1F5),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: context.propHeight(16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Collecting Moodboard from Dribbble.com',
                                  style:
                                      context.textTheme.headlineSmall?.copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '1 Day Left',
                                  style: TextStyle(
                                    color: const Color(0xFF951111),
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: context.propHeight(8)),
                            Text(
                              "Let's return to design thinking. Over time designers have built up their own body of approaches to solving classes of problems.",
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF9E9E9E),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(height: context.propHeight(8)),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 40,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 13),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: AppColors.primaryColor,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'View Details',
                                  style:
                                      context.textTheme.labelMedium?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: context.propHeight(16)),

              /*  _buildMyCourses(
                      title: 'My Library',
                      onTab: () {
                        Modular.to.pushNamed(AppRoutes.myLibraryScreen);
                      },
                    ), */
              Container(
                width: 335,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continue watching',
                      style: context.textTheme.headlineLarge?.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        
                      ),
                    ),
                  ],
                ),
              ),
              CourseListHorizontal(courses: courses), // Keep as is
            ],
          ),
        ),
      ),
    );
  }
}

class FullscreenPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullscreenPlayer({super.key, required this.controller});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  bool _isMuted = false;
  bool _isDragging = false;
  double _dragValue = 0.0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    // Continuously rebuild to sync the progress bar
    widget.controller.addListener(() {
      if (!_isDragging && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    final duration = controller.value.duration;
    final position = controller.value.position;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black54, Colors.transparent],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Progress bar
                  Slider(
                    activeColor: Colors.orange,
                    inactiveColor: Colors.white30,
                    min: 0.0,
                    max: duration.inSeconds.toDouble(),
                    value: _isDragging
                        ? _dragValue
                        : position.inSeconds
                            .clamp(0, duration.inSeconds)
                            .toDouble(),
                    onChanged: (val) {
                      setState(() {
                        _isDragging = true;
                        _dragValue = val;
                      });
                    },
                    onChangeEnd: (val) {
                      setState(() {
                        _isDragging = false;
                        controller.seekTo(Duration(seconds: val.toInt()));
                      });
                    },
                  ),

                  // Time info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(position),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                      Text(_formatDuration(duration),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12)),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.value.isPlaying
                                ? controller.pause()
                                : controller.play();
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.replay_10, color: Colors.white),
                        onPressed: () {
                          final pos = controller.value.position -
                              const Duration(seconds: 10);
                          controller.seekTo(
                              pos > Duration.zero ? pos : Duration.zero);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isMuted = !_isMuted;
                            controller.setVolume(_isMuted ? 0 : 1);
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.fullscreen_exit,
                            color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
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
