import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toybox/screens/background_play/background_play_screen_controller.dart';
import 'package:flutter_toybox/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

class BackgroundPlayScreen extends StatelessWidget {
  const BackgroundPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BackgroundPlayController()..init(),
      child: _BackgroundPlayScreen(),
    );
  }
}

class _BackgroundPlayScreen extends StatelessWidget {
  const _BackgroundPlayScreen();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text('Background Play Sample'),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.orange[600]!,
              Colors.orange[400]!,
              Colors.orange[200]!,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Spacer(),
              Selector(
                selector:
                    (BuildContext ctx, BackgroundPlayController controller) =>
                        controller.progressBarState,
                builder: (BuildContext ctx, ProgressBarState state, _) =>
                    ProgressBar(
                  progress: state.current,
                  buffered: state.buffered,
                  total: state.total,
                  onSeek: (Duration position) =>
                      context.read<BackgroundPlayController>().seek(position),
                ),
              ),
              Selector(
                selector:
                    (BuildContext ctx, BackgroundPlayController controller) =>
                        controller.audioState,
                builder: (BuildContext ctx, AudioState state, _) {
                  switch (state) {
                    case AudioState.loading:
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 32,
                          width: 32,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    case AudioState.ready:
                    case AudioState.paused:
                      return IconButton(
                        onPressed: () =>
                            context.read<BackgroundPlayController>().play(),
                        icon: Icon(Icons.play_arrow),
                        iconSize: 32.0,
                      );
                    case AudioState.playing:
                      return IconButton(
                        onPressed: () =>
                            context.read<BackgroundPlayController>().pause(),
                        icon: Icon(Icons.pause),
                        iconSize: 32.0,
                      );
                    default:
                      return SizedBox(
                        height: 32,
                        width: 32,
                      );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
