// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:media_kit_video/media_kit_video.dart';
//
// class VideoPlayer extends StatefulWidget {
//   final VideoController controller;
//   const VideoPlayer({
//     super.key,
//     required this.controller,
//   });
//
//   @override
//   State<VideoPlayer> createState() => _VideoPlayerState();
// }
//
// class _VideoPlayerState extends State<VideoPlayer> {
//   bool hasRender = false;
//   // Widget _buildVideoPanel() {
//   //   return VideoControllerPanel(
//   //     controller: widget.controller,
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     bool isDesktop = Platform.isWindows;
//     if (isDesktop || widget.controller.videoPlayerIndex == 4) {
//       return Obx(() => widget.controller.mediaPlayerControllerInitialized.value
//           ? media_kit_video.Video(
//               key: widget.controller.key,
//               controller: widget.controller.mediaPlayerController,
//               fit: widget.controller.settings
//                   .videofitArrary[widget.controller.videoFitIndex.value],
//               controls: widget.controller.room.platform == Sites.iptvSite
//                   ? media_kit_video.MaterialVideoControls
//                   : (state) => _buildVideoPanel(),
//             )
//           : Card(
//               elevation: 0,
//               margin: const EdgeInsets.all(0),
//               shape:
//                   const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//               clipBehavior: Clip.antiAlias,
//               color: Get.theme.focusColor,
//               child: CachedNetworkImage(
//                 cacheManager: CustomCacheManager.instance,
//                 imageUrl: widget.controller.room.cover!,
//                 fit: BoxFit.fill,
//                 errorWidget: (context, error, stackTrace) => const Center(
//                   child: Icon(Icons.live_tv_rounded, size: 48),
//                 ),
//               ),
//             ));
//     } else {
//       return Obx(
//         () => widget.controller.mediaPlayerControllerInitialized.value
//             ? Chewie(
//                 controller: widget.controller.chewieController,
//               )
//             : Card(
//                 elevation: 0,
//                 margin: const EdgeInsets.all(0),
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero),
//                 clipBehavior: Clip.antiAlias,
//                 color: Get.theme.focusColor,
//                 child: CachedNetworkImage(
//                   cacheManager: CustomCacheManager.instance,
//                   imageUrl: widget.controller.room.cover!,
//                   fit: BoxFit.fill,
//                   errorWidget: (context, error, stackTrace) => const Center(
//                     child: Icon(Icons.live_tv_rounded, size: 48),
//                   ),
//                 ),
//               ),
//       );
//     }
//   }
// }
