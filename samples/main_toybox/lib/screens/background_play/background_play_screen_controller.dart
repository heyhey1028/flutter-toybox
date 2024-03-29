import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../services/service_locator.dart';
import 'audio_handler.dart';

class BackgroundPlayController extends ChangeNotifier {
  ProgressBarState progressBarState = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );
  AudioState audioState = AudioState.paused;
  late StreamSubscription _playbackSubscription;
  late StreamSubscription _progressBarSubscription;

  AudioServiceHandler _handler = getIt<AudioServiceHandler>();

  // for test
  static final _item = MediaItem(
    id: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  /* --- INITIALIZE --- */
  void init() {
    _handler.initPlayer(_item);
    _listenToPlaybackState();
    _listenForProgressBarState();
  }

  /* --- SUBSCRIBE --- */

  void _listenToPlaybackState() {
    _playbackSubscription =
        _handler.playbackState.listen((PlaybackState state) {
      print('current state:${state.processingState}');
      print('playing:${state.playing}');

      if (isLoadingState(state)) {
        setAudioState(AudioState.loading);
      } else if (isAudioReady(state)) {
        setAudioState(AudioState.ready);
      } else if (isAudioPlaying(state)) {
        setAudioState(AudioState.playing);
      } else if (isAudioPaused(state)) {
        setAudioState(AudioState.paused);
      } else if (hasCompleted(state)) {
        setAudioState(AudioState.paused);
      }
    });
  }

  void _listenForProgressBarState() {
    _progressBarSubscription = CombineLatestStream.combine3(
      AudioService.position,
      _handler.playbackState,
      // _handler.mediaItem
      // (Duration current, PlaybackState state, MediaItem mediaItem) =>
      _handler.player.durationStream,
      (Duration current, PlaybackState state, Duration? total) =>
          ProgressBarState(
        current: current,
        buffered: state.bufferedPosition,
        // total: mediaItem?.duraion ?? Duration.zero
        total: total ?? Duration.zero,
      ),
    ).listen((ProgressBarState state) => setProgressBarState(state));
  }

  /* --- UTILITY METHODS --- */
  bool isLoadingState(PlaybackState state) {
    return state.processingState == AudioProcessingState.loading ||
        state.processingState == AudioProcessingState.buffering;
  }

  bool isAudioReady(PlaybackState state) {
    return state.processingState == AudioProcessingState.ready &&
        !state.playing;
  }

  bool isAudioPlaying(PlaybackState state) {
    return state.playing && !hasCompleted(state);
  }

  bool isAudioPaused(PlaybackState state) {
    return !state.playing && !isLoadingState(state);
  }

  bool hasCompleted(PlaybackState state) {
    return state.processingState == AudioProcessingState.completed;
  }

  @override
  void dispose() {
    _handler.stop();
    _playbackSubscription.cancel();
    _progressBarSubscription.cancel();
    super.dispose();
  }

  /* --- STATE CONTROL --- */

  void setAudioState(AudioState state) {
    audioState = state;
    notifyListeners();
  }

  void setProgressBarState(ProgressBarState state) {
    progressBarState = state;
    notifyListeners();
  }

  /* --- PLAYER CONTROL  --- */
  void play() => _handler.play();

  void pause() => _handler.pause();

  void seek(Duration position) => _handler.seek(position);

  void stop() => _handler.stop();
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum AudioState {
  ready,
  paused,
  playing,
  loading,
}
