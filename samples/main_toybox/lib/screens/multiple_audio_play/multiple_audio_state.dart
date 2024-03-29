import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toybox/screens/background_play/audio_handler.dart';
import 'package:flutter_toybox/screens/services/service_locator.dart';
import 'package:rxdart/rxdart.dart';

class MultipleAudioState extends ChangeNotifier {
  ProgressBarState progressBarState = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  );
  AudioState audioState = AudioState.paused;
  late AnimationController volumeControl;
  late StreamSubscription _playbackSubscription;
  late StreamSubscription _progressBarSubscription;
  late StreamSubscription _volumeSubscription;
  double volumeFactor = 1;

  AudioServiceHandler _handler = getIt<AudioServiceHandler>();

  // for test
  static final _item = MediaItem(
    id: 'https://firebasestorage.googleapis.com/v0/b/flutter-toybox.appspot.com/o/audios%2Fmusic_box.mp3?alt=media&token=cf88a17e-bbe9-46de-95a8-e855a23fbb3b',
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  static final _item1 = MediaItem(
    id: 'https://firebasestorage.googleapis.com/v0/b/flutter-toybox.appspot.com/o/audios%2Fsuzu_mushi.mp3?alt=media&token=8222b9e0-8b4d-4e0f-ae2c-6e602606dfcd',
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  static final _item2 = MediaItem(
    id: 'https://firebasestorage.googleapis.com/v0/b/flutter-toybox.appspot.com/o/audios%2Fwave.mp3?alt=media&token=40388f98-210c-4f4d-8c72-ac0b21232dd5',
    album: "Science Friday",
    title: "A Salute To Head-Scratching Science",
    artist: "Science Friday and WNYC Studios",
    duration: const Duration(milliseconds: 5739820),
    artUri: Uri.parse(
        'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
  );

  /* --- INITIALIZE --- */
  Future<void> init(TickerProvider provider) async {
    _handler.initPlayer(_item);
    _listenToPlaybackState();
    _listenForProgressBarState();
    await _listenToVolumeControl(provider);
    _listenVolume();
  }

  /* --- SUBSCRIBE --- */

  void _listenToPlaybackState() {
    _playbackSubscription =
        _handler.playbackState.listen((PlaybackState state) {
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

  Future<void> _listenToVolumeControl(TickerProvider provider) async {
    final Duration duration =
        await _handler.player.durationStream.first ?? Duration.zero;
    volumeControl = AnimationController(vsync: provider, duration: duration)
      ..addListener(() => _handler.setVolume(1 - volumeControl.value));
    notifyListeners();
  }

  void _listenVolume() {
    _volumeSubscription = _handler.player.volumeStream.listen((double p0) {
      volumeFactor = p0;
      double currentVol1 = _handler.subPlayer1.volume;
      double currentVol2 = _handler.subPlayer2.volume;
      if (currentVol1 != null) _handler.setVolume1(sliderValue1 * p0);
      if (currentVol2 != null) _handler.setVolume2(sliderValue2 * p0);
    });
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
    volumeControl.dispose();
    _playbackSubscription.cancel();
    _progressBarSubscription.cancel();
    _volumeSubscription.cancel();
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

  /* --- SUB AUDIO CONTROL --- */
  void setSubAudio1() {
    _handler.setAudioSource1(_item1);
  }

  void setSubAudio2() {
    _handler.setAudioSource2(_item2);
  }

  double sliderValue1 = 1;
  double sliderValue2 = 1;

  void setVolume1(double value) {
    sliderValue1 = value;
    _handler.setVolume1(value * volumeFactor);
    notifyListeners();
  }

  void setVolume2(double value) {
    sliderValue2 = value;
    _handler.setVolume2(value * volumeFactor);
    notifyListeners();
  }

  /* --- PLAYER CONTROL  --- */
  void play() {
    _handler.play();
    volumeControl.forward();
  }

  void pause() {
    _handler.pause();
    volumeControl.stop();
  }

  void seek(Duration position) {
    _handler.seek(position);
    final double current =
        position.inMicroseconds / progressBarState.total!.inMicroseconds;
    volumeControl.value = current;
    notifyListeners();
  }

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
  final Duration? total;
}

enum AudioState {
  ready,
  paused,
  playing,
  loading,
}
