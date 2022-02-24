import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:volume_controller/volume_controller.dart';

Future<AudioServiceHandler> initeAudioService() async {
  return await AudioService.init(
      builder: () => AudioServiceHandler(),
      config: AudioServiceConfig(
        androidNotificationChannelId: 'com.mycompany.myapp.audio',
        androidNotificationChannelName: 'Test Audio Service',
        androidNotificationOngoing: true,
        androidStopForegroundOnPause: true,
      ));
}

class AudioServiceHandler extends BaseAudioHandler {
  final AudioPlayer player = AudioPlayer();

  Future<void> initPlayer(MediaItem item) async {
    try {
      _notifyAudioHandlerAboutPlaybackEvents();
      mediaItem.add(item);
      player.setAudioSource(AudioSource.uri(Uri.parse(item.id)));
    } catch (e) {
      print('ERROR OCCURED:$e');
    }
  }

  /* --- SUBSCRIBE --- */
  void _notifyAudioHandlerAboutPlaybackEvents() {
    player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = player.playing;
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.skipToPrevious,
          if (playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
          MediaControl.skipToNext,
        ],
        systemActions: const {
          MediaAction.seek,
        },
        androidCompactActionIndices: const [0, 1, 3],
        processingState: const {
          ProcessingState.idle: AudioProcessingState.idle,
          ProcessingState.loading: AudioProcessingState.loading,
          ProcessingState.buffering: AudioProcessingState.buffering,
          ProcessingState.ready: AudioProcessingState.ready,
          ProcessingState.completed: AudioProcessingState.completed,
        }[player.processingState],
        playing: playing,
        updatePosition: player.position,
        bufferedPosition: player.bufferedPosition,
        speed: player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  /* --- Audio Control --- */
  @override
  Future<void> play() async {
    await player.play();
  }

  @override
  Future<void> pause() => player.pause();

  @override
  Future<void> seek(Duration position) => player.seek(position);

  @override
  Future<void> stop() {
    player.stop();
    return super.stop();
  }

  /* --- Volume Control --- */

  double getVolume() {
    return player.volume;
  }

  void setVolume(double volume) {
    player.setVolume(volume);
  }
}
