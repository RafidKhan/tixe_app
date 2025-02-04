import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_video/controller/my_workout_video_controller.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:video_player/video_player.dart';

import '../../../../constant/app_url.dart';

class MyWorkoutVideoScreen extends StatefulWidget {
  final WorkoutPhase phase;

  const MyWorkoutVideoScreen({
    super.key,
    required this.phase,
  });

  @override
  State<MyWorkoutVideoScreen> createState() => _MyWorkoutVideoScreenState();
}

class _MyWorkoutVideoScreenState extends State<MyWorkoutVideoScreen> {
  final controller = MyWorkoutVideoController();
  VideoPlayerController? videoPlayerController;

  TimerType timerState = TimerType.NOT_STARTED;

  bool isLoading = false;
  bool isPlaying = false;
  Duration elapsedTime = Duration.zero;
  int layerToAnimate = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();
    Future(() {
      initializeVideo();
    });
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        elapsedTime += const Duration(seconds: 1);
        timerState = TimerType.PLAY;
      });
    });
  }

  pauseTimer() {
    setState(() {
      timerState = TimerType.PAUSE;
    });
    timer?.cancel();
  }

  resumeTimer() {
    setState(() {
      timerState = TimerType.PLAY;
    });
    startTimer();
  }

  stopTimer() {
    setState(() {
      timerState = TimerType.COMPLETE;
      elapsedTime = Duration.zero;
    });
    timer?.cancel();
  }

  initializeVideo() async {
    if (widget.phase.videoUrl != null) {
      setState(() {
        isLoading = true;
      });
      final fullUrl = '${AppUrl.baseStorage.url}${widget.phase.videoUrl}';
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(fullUrl));

      await videoPlayerController!.initialize();

      videoPlayerController!.addListener(() {
        setState(() {
          if (videoPlayerController!.value.position ==
              videoPlayerController!.value.duration) {
            isPlaying = false;
          }
        });
      });

      setState(() {
        isLoading = false;
      });
    }
  }

  void togglePlayPause() {
    setState(() {
      if (videoPlayerController!.value.isPlaying) {
        videoPlayerController!.pause();
        isPlaying = false;
      } else {
        videoPlayerController!.play();
        isPlaying = true;
      }
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            GlobalHeaderWidget(title: widget.phase.title ?? ""),
            if (isLoading)
              const GlobalCircularLoader()
            else if (!isLoading && videoPlayerController != null) ...[
              GestureDetector(
                onTap: togglePlayPause,
                child: Container(
                  height: 200.h,
                  width: context.width,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        VideoPlayer(videoPlayerController!),
                        Positioned(
                          bottom: 20.h, // Bottom of the video container
                          right: 20.w, // Right side of the video container
                          child: InkWell(
                            onTap: togglePlayPause,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: KColor.btnGradient1.color,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(10.r),
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                size: 20.r,
                                color: KColor.white.color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Outer Circle
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 150.w,
                        height: 150.h,
                        decoration: BoxDecoration(
                          color: layerToAnimate == 0
                              ? KColor.btnGradient1.color
                              : KColor.primary.color.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Middle Circle
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 130.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                          color: layerToAnimate == 1
                              ? KColor.btnGradient1.color
                              : KColor.primary.color.withOpacity(0.7),
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Inner Circle
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: 110.w,
                        height: 110.h,
                        decoration: BoxDecoration(
                          color: layerToAnimate == 2
                              ? KColor.btnGradient1.color
                              : KColor.primary.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Timer Text
                      Positioned(
                        child: Text(
                          formatDuration(elapsedTime),
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: KColor.white.color,
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: KColor.btnGradient1.color,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (timerState == TimerType.NOT_STARTED) ...[
                InkWell(
                  onTap: () => startTimer(),
                  child: GlobalText(
                    str: context.loc.play,
                    color: KColor.btnGradient1.color,
                  ),
                ),
              ] else if (timerState == TimerType.PLAY) ...[
                InkWell(
                  onTap: () => pauseTimer(),
                  child: GlobalText(
                    str: context.loc.pause,
                    color: KColor.btnGradient1.color,
                  ),
                ),
              ] else if (timerState == TimerType.PAUSE) ...[
                InkWell(
                  onTap: () => resumeTimer(),
                  child: GlobalText(
                    str: context.loc.resume,
                    color: KColor.btnGradient1.color,
                  ),
                ),
              ]
            ]
          ],
        ),
        bottomNavigationBar: isLoading
            ? null
            : GlobalBottomButton(
                onPressed: () {
                  stopTimer();
                  controller.completeWorkoutPhase(phase: widget.phase);
                },
                buttonText: context.loc.complete,
              ));
  }
}
