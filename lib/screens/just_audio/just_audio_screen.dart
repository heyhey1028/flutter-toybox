import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toybox/widgets/app_scaffold.dart';

class JustAudioScreen extends StatelessWidget {
  const JustAudioScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text('Just Audio Sample'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.red[600],
              Colors.red[400],
              Colors.red[200],
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              ProgressBar(
                progress: Duration.zero,
                total: Duration.zero,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.play_arrow),
                iconSize: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
