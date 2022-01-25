import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:reels_instagram/model/reel.dart';
import 'package:video_player/video_player.dart';

class VideoSideAcction extends StatefulWidget {
  VideoSideAcction({Key? key, required this.reel}) : super(key: key);
  final Reel reel;
  @override
  _VideoSideAcctionState createState() => _VideoSideAcctionState();
}

class _VideoSideAcctionState extends State<VideoSideAcction> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    _videoPlayerController = VideoPlayerController.asset(widget.reel.videoUrl);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        showControls: true,
        showControlsOnInitialize: true,
        allowFullScreen: false,
        materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.black,
          bufferedColor: Colors.white,
        ),
        cupertinoProgressColors: ChewieProgressColors(
            playedColor: Colors.yellow,
            bufferedColor: Colors.blue,
            backgroundColor: Colors.red));
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();

    _videoPlayerController.dispose();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController!,
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Loading",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24,
                        )),
                  ],
                ),
              ));
  }
}
