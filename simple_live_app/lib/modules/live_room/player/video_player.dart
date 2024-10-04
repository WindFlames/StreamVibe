import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:media_kit_video/media_kit_video.dart' as media_kit_video;
import 'package:simple_live_app/modules/live_room/player/video_controller.dart';

class VideoPlayer extends StatefulWidget {
  final VideoController controller;
  const VideoPlayer({
    super.key,
    required this.controller,
  });

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  bool hasRender = false;
  // Widget _buildVideoPanel() {
  //   return VideoControllerPanel(
  //     controller: widget.controller,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.controller.isMediaKit) {
      return Obx(() => widget.controller.mediaPlayerControllerInitialized.value
          ? media_kit_video.Video(
              key: widget.controller.key,
              controller: widget.controller.mediaPlayerController,
              //fit: ,
              controls:
                   media_kit_video.MaterialVideoControls

            )
          : const Center(child: CircularProgressIndicator()));
    } else {
      return Obx(
        () => widget.controller.mediaPlayerControllerInitialized.value
            ? Chewie(
                controller: widget.controller.chewieController,
              )
            : const Center(child: CircularProgressIndicator()),
      );
    }
  }
}
