import 'package:video_player/video_player.dart';

import '../../controller/bytes_controller.dart';
import '../../model/bytes_data_model.dart';
import '../../utils/export.dart';

class VideoReelItem extends StatefulWidget {
  final Datum? video;

  const VideoReelItem({super.key, required this.video});

  @override
  VideoReelItemState createState() => VideoReelItemState();
}

class VideoReelItemState extends State<VideoReelItem> {
  late VideoPlayerController _controller;
  bool isInitialized = false;
  var bytesController = Get.find<BytesController>();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.video?.cdnUrl??""),)
      ..initialize().then((_) {
        setState(() {
          isInitialized = true;
        });
        _controller.play(); // Automatically start playing the video
        _controller.setLooping(true); // Loop video for TikTok-like behavior
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isInitialized
        ? GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.2),
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                color: Colors.black.withOpacity(0.3),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.video?.title ?? '',
                      maxLines: 3,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                   Obx(() =>  bytesController.isPaginatingBytes.value
                       ?  loadingWidget():getShrinkSizedBox(),)
                    // Add additional video details here (likes, comments, etc.)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
        : Center(child: loadingWidget()); // Show loading indicator while the video initializes
  }
}