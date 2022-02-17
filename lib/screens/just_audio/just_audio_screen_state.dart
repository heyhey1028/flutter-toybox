import 'package:flutter/material.dart';

class PageManager extends ChangeNotifier {
  ProgressBarState progressBarState;
  ButtonState buttonState = ButtonState.paused;
}

class ProgressBarState {
  ProgressBarState({
    this.current,
    this.buffered,
    this.total,
  });

  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState {
  paused,
  playing,
  loading,
}
