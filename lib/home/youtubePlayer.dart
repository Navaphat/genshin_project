import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class youtubePlayer extends StatefulWidget {
  youtubePlayer({Key? key, required this.url}) : super(key: key);
  final url;
  @override
  State<youtubePlayer> createState() => _youtubePlayerState();
}

class _youtubePlayerState extends State<youtubePlayer> {

  late YoutubePlayerController _controller;


  runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(widget.url)!,
      params: YoutubePlayerParams(
        showControls: true,
        autoPlay: false,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    runYoutubePlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: YoutubePlayerIFrame(
        controller: _controller,
        aspectRatio: 16/9,
      ),
    );
  }
}
