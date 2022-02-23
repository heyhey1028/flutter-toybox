import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

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
  final AudioPlayer _player = AudioPlayer();

  Future<void> initPlayer(MediaItem item) async {
    try {
      _notifyAudioHandlerAboutPlaybackEvents();
      mediaItem.add(item);
      _player.setAudioSource(AudioSource.uri(Uri.parse(item.id)));
    } catch (e) {
      print('ERROR OCCURED:$e');
    }
  }

  /* --- SUBSCRIBE --- */
  void _notifyAudioHandlerAboutPlaybackEvents() {
    _player.playbackEventStream.listen((PlaybackEvent event) {
      final playing = _player.playing;
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
        }[_player.processingState],
        playing: playing,
        updatePosition: _player.position,
        bufferedPosition: _player.bufferedPosition,
        speed: _player.speed,
        queueIndex: event.currentIndex,
      ));
    });
  }

  /* --- METHODS --- */
  @override
  Future<void> play() async {
    print('play called');
    await _player.play();
  }

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position) => _player.seek(position);

  @override
  Future<void> stop() {
    _player.stop();
    return super.stop();
  }
}
